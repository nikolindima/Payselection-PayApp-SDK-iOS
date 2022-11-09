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
    public var secretKey: String
    
    public init(merchantId: String, publicKey: String, secretKey: String) {
        self.merchantId = merchantId
        self.publicKey = publicKey
        self.secretKey = secretKey
    }
}
