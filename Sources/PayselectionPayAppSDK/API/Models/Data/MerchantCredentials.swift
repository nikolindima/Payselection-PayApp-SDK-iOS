//
//  MerchantCredentials.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

public struct MerchantCredentials {
    public var merchantId: String
    public var publicKey: String
    
    public init(merchantId: String, publicKey: String) {
        self.merchantId = merchantId
        self.publicKey = publicKey
    }
}
