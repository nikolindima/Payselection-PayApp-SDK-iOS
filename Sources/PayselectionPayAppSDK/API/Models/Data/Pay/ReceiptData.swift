//
//  ReceiptData.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

struct ReceiptData: Codable {
    var timestamp: String
    var externalId: String
    var receipt: Receipt
}

struct Receipt: Codable {
    
}
