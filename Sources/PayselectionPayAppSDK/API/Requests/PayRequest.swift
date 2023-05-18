//
//  PayRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 31.10.22.
//

import Foundation

class PayRequest: BaseRequest, PayselectionRequestType {
    typealias ResponseType = PayResult
    var data: PayselectionRequest {
        return PayselectionRequest(path: PayselectionHTTPResource.pay.asUrl(networkUrl: path), method: .post, body: body, headers: headers)
    }
}
