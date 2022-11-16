//
//  File.swift
//  
//
//  Created by Alexander Kogalovsky on 16.11.22.
//

import Foundation

struct EncryptedData: Codable {
    var signedMessage: String
    var iv: String
    var tag: String
}

struct SignedMessage: Codable {
    var encryptedMessage: String
    var ephemeralPublicKey: String
}
