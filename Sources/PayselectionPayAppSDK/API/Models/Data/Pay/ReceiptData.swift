//
//  ReceiptData.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct ReceiptData: Codable {
    public var timestamp: String
    public var externalId: String
    public var receipt: Receipt
}

public struct Receipt: Codable {
    
}
