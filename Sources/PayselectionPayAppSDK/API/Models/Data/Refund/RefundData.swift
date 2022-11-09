//
//  RefundData.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

public struct RefundData: Codable {
    
    public var transactionId: String
    public var amount: String
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case transactionId = "TransactionId"
        case amount = "Amount"
        case currency = "Currency"
    }
    
    public init(transactionId: String,
                amount: String,
                currency: String) {
        self.transactionId = transactionId
        self.amount = amount
        self.currency = currency
    }
}

