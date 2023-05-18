//
//  TransactionStatusRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

class TransactionStatusRequest: BaseRequest, PayselectionRequestType {
    typealias ResponseType = StatusResult
    var data: PayselectionRequest {
        return PayselectionRequest(path: PayselectionHTTPResource.transactionStatus.asUrl(networkUrl: path).appending(orderId ?? ""), method: .get, body: nil, headers: headers)
    }
}
