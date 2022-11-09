//
//  ConfirmRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

class ConfirmRequest: BaseRequest, PayselectionRequestType {
    typealias ResponseType = ConfirmResult
    var data: PayselectionRequest {
        return PayselectionRequest(path: PayselectionHTTPResource.confirm.asUrl(), method: .post, body: body, headers: headers)
    }
}
