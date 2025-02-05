//
//  PaymentPrivateDetails.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct PaymentPrivateDetails: Codable {
    
    public var transactionDetails: TransactionDetails
    public var paymentMethod: PaymentMethod
    public var paymentDetails: CardDetails
    public var messageExpiration: String
    
    enum CodingKeys: String, CodingKey {
        case transactionDetails = "TransactionDetails"
        case paymentMethod = "PaymentMethod"
        case paymentDetails = "PaymentDetails"
        case messageExpiration = "MessageExpiration"
    }
    
    public init(transactionDetails: TransactionDetails, paymentMethod: PaymentMethod, paymentDetails: CardDetails, messageExpiration: String) {
        self.transactionDetails = transactionDetails
        self.paymentMethod = paymentMethod
        self.paymentDetails = paymentDetails
        self.messageExpiration = messageExpiration
    }
}
