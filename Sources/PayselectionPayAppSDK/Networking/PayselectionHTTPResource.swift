//
//  PayselectionHTTPResource.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 20.10.22.
//

import Foundation

enum PayselectionHTTPResource: String {
    private static let baseURLString = "https://gw.payselection.com"
    
    case pay = "/payments/requests/public"
    case transactionStatus = "/transactions/"
    
    
    func asUrl() -> String {
        return PayselectionHTTPResource.baseURLString.appending(self.rawValue)
    }
}
