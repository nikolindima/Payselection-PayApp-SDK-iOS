//
//  PaySelectionApi.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 31.10.22.
//

import Foundation
import CryptoKit

public class PayselectionAPI {
    
    public typealias PayselectionRequestCompletion<T> = (Result<T, Error>) -> Void
    
    private let merchantCreds: MerchantCredentials
    
    public init(merchantCredentials: MerchantCredentials) {
        self.merchantCreds = merchantCredentials
    }
    
    public func pay(paymentFormData: PaymentFormData,
                    completion: @escaping PayselectionRequestCompletion<PayResult>) {
        
        let cardDetails = CardDetails(cardNumber: paymentFormData.cardNumber,
                                      expMonth: paymentFormData.cardExpMonth,
                                      expYear: paymentFormData.cardExpYear,
                                      cardholderName: paymentFormData.cardHolderName,
                                      cvc: paymentFormData.cvc)
        
        let transactionDetails = TransactionDetails(amount: paymentFormData.amount, currency: paymentFormData.currency)
        let secretPaymentDetails = PaymentPrivateDetails(transactionDetails: transactionDetails,
                                                         paymentMethod: .token,
                                                         paymentDetails: cardDetails,
                                                         messageExpiration: paymentFormData.messageExpiration)
        
        guard let token = try? Encryptor().makeCryptogram(publicKey: merchantCreds.publicKey,
                                                          privateDetails: secretPaymentDetails) else {
            completion(.failure(PayselectionError.encryptionError))
            return
        }
        
        let paymentDetails = PaymentDetails(type: .internal , payToken: token)
        let paymentData = PaymentData(orderId: paymentFormData.orderId,
                                      amount: transactionDetails.amount,
                                      currency: transactionDetails.currency,
                                      description: paymentFormData.description,
                                      customerInfo: paymentFormData.customerInfo,
                                      paymentMethod: .token,
                                      paymentDetails: paymentDetails)
        
        guard let requestBodyString = self.getRequestBody(from: paymentData) else { return }
        let headers = self.generatePayHeaders(merchantId: self.merchantCreds.merchantId,
                                              requestURL: PayselectionHTTPResource.pay.rawValue,
                                              requestBody: requestBodyString)
        let request = PayRequest(body: paymentData, headers: headers)
        request.execute(
            onSuccess: { result in
                completion(.success(result))
            },
            onError: { error in
                completion(.failure(error))
            })
        
    }

    public func getTransactionStatus(transactionId: String,
                                     transactionKey: String,
                                     completion: @escaping PayselectionRequestCompletion<StatusResult>) {
        
        let headers = generateTransactionsHeader(merchantId: merchantCreds.merchantId,
                                                 httpMethod: .get,
                                                 requestURL:PayselectionHTTPResource.transactionStatus.rawValue.appending(transactionId),
                                                 transactionKey: transactionKey,
                                                 requestBody: nil)

        let request = TransactionStatusRequest(body: nil, headers: headers, orderId: transactionId)
        request.execute(
            onSuccess: { result in
                completion(.success(result))
            },
            onError: { error in
                completion(.failure(error))
            })
    }
    
    private func generatePayHeaders(merchantId: String,
                                    requestURL: String,
                                    requestBody: String?) -> [String: String] {
        var headers = [String: String]()
        headers["X-SITE-ID"] = merchantId
        headers["X-REQUEST-ID"] = UUID().uuidString
        
        return headers
    }
    
    private func generateTransactionsHeader(merchantId: String,
                                            httpMethod: HTTPMethod,
                                            requestURL: String,
                                            transactionKey: String,
                                            requestBody: String?) -> [String: String] {
        
        var headers = [String: String]()
        headers["X-REQUEST-AUTH"] = "public"
        headers["X-SITE-ID"] = merchantId
        headers["X-REQUEST-ID"] = UUID().uuidString
        guard let xRequestId = headers["X-REQUEST-ID"] else { return [:] }
        headers["X-REQUEST-SIGNATURE"] = getXRequestSignature(httpMethod: httpMethod,
                                                              requestURL: requestURL,
                                                              xSiteId: merchantId,
                                                              xRequestId:  xRequestId,
                                                              secretKey:  transactionKey,
                                                              requestBody: nil)
        
        return headers
    }
    
    private func getRequestBody(from object: Codable) -> String? {
        do {
            let body = try getJSONString(from: object)
            return body
        } catch {
            return nil
        }
    }
    
    private func getJSONString(from object: Codable) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .withoutEscapingSlashes
        do {
            let data = try encoder.encode(object)
            return String(data: data, encoding: .utf8)!
        } catch {
            throw error
        }
    }
    
    private func getXRequestSignature(httpMethod: HTTPMethod,
                                      requestURL: String,
                                      xSiteId: String,
                                      xRequestId: String,
                                      secretKey: String,
                                      requestBody: String?) -> String {
        
        let signatureBody = "\(httpMethod.rawValue)\n\(requestURL)\n\(xSiteId)\n\(xRequestId)\n\(requestBody ?? "")"
        let sign = getHMACsignature(for: signatureBody, key: secretKey)
        return sign
    }
    
    private func getHMACsignature(for plaintext: String, key: String) -> String {
        let key = SymmetricKey(data: Data(key.utf8))
        let signature = HMAC<SHA256>.authenticationCode(for: Data(plaintext.utf8), using: key)
        let signatureString = Data(signature).map { String(format: "%02hhx", $0) }.joined()
        return signatureString
    }
}


