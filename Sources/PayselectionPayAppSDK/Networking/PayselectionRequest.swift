//
//  PayselectionRequest.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 20.10.22.
//

import Foundation

struct PayselectionRequest {
    let path: String
    let method: HTTPMethod
    let body: Codable?
    let headers: [String: String]
    
    init(path: String,
         method: HTTPMethod = .get,
         body: Codable?,
         headers: [String: String] = [:]) {
        self.path = path
        self.method = method
        self.body = body
        self.headers = headers
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}
