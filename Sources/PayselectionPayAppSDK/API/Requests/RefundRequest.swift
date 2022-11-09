//
//  RefundRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

class RefundRequest: BaseRequest, PayselectionRequestType {
    typealias ResponseType = RefundResult
    var data: PayselectionRequest {
        return PayselectionRequest(path: PayselectionHTTPResource.refund.asUrl(), method: .post, body: body, headers: headers)
    }
}
