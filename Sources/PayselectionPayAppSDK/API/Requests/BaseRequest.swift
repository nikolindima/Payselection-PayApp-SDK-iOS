//
//  BaseRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 31.10.22.
//

import Foundation

class BaseRequest {
    var body: Codable?
    var headers: [String: String]
    var orderId: String?
    
    init(body: Codable?, headers: [String: String] = [:], orderId: String? = nil) {
        self.body = body
        self.headers = headers
        self.orderId = orderId
    }
}
