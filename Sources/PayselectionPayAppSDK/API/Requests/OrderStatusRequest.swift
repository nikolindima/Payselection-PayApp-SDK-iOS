//
//  StatusRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 1.11.22.
//

import Foundation

class OrderStatusRequest: BaseRequest, PayselectionRequestType {
    typealias ResponseType = [StatusResult]
    var data: PayselectionRequest {
        return PayselectionRequest(path: PayselectionHTTPResource.orderStatus.asUrl().appending(orderId ?? ""), method: .get, body: nil, headers: headers)
    }
}
