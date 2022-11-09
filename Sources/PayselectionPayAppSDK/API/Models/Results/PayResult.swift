//
//  TransactionResponse.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 31.10.22.
//

import Foundation

public struct PayResult: Codable {
    
    public var orderId: String
    public var transactionId: String
    public var amount: String
    public var currency: String
    
    enum CodingKeys: String, CodingKey {
        case orderId = "OrderId"
        case transactionId = "TransactionId"
        case amount = "Amount"
        case currency = "Currency"
    }
}
