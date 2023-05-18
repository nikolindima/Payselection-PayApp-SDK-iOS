//
//  PayselectionHTTPResource.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 20.10.22.
//

import Foundation

enum PayselectionHTTPResource: String {
    
    case pay = "/payments/requests/public"
    case transactionStatus = "/transactions/"
    
    
    func asUrl(networkUrl: String) -> String {
        return networkUrl.appending(self.rawValue)
    }
}
