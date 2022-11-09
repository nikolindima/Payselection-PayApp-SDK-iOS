//
//  ConfirmResult.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

public struct ConfirmResult: Codable {
    
    public var orderId: String
    public var transactionId: String
    public var amount: String
    public var currency: String
    public var rebillId: String?
    
    enum CodingKeys: String, CodingKey {
        case orderId = "OrderId"
        case transactionId = "TransactionId"
        case amount = "Amount"
        case currency = "Currency"
        case rebillId = "RebillId"
    }
}
