//
//  ConfirmData.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 2.11.22.
//

import Foundation

public struct ConfirmData: Codable {
    
    public var transactionId: String
    public var orderId: String
    public var paReq: String
    public var md: String
    
    enum CodingKeys: String, CodingKey {
        case transactionId = "TransactionId"
        case orderId = "OrderId"
        case paReq = "PaReq"
        case md = "MD"
    }
    
    public init(transactionId: String, orderId: String, paReq: String, md: String) {
        self.transactionId = transactionId
        self.orderId = orderId
        self.paReq = paReq
        self.md = md
    }
}
