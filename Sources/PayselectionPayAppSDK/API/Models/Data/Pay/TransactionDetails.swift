//
//  TransactionDetails.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct TransactionDetails: Codable {
    
    public var amount: String
    public var currency: String
    
    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
        case currency = "Currency"
    }
    
    public init(amount: String, currency: String) {
        self.amount = amount
        self.currency = currency
    }
}
