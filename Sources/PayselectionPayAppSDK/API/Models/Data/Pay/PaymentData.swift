//
//  Payment.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 30.10.22.
//

import Foundation

public struct PaymentData: Codable {
    
    public var orderId: String
    public var amount: String
    public var currency: String
    public var description: String
    public var rebillFlag: Bool?
    public var customerInfo: CustomerInfo
    public var extraData: ExtraData?
    public var paymentMethod: PaymentMethod
    public var receiptData: ReceiptData?
    public var paymentDetails: PaymentDetails
    
    enum CodingKeys: String, CodingKey {
        case orderId = "OrderId"
        case amount = "Amount"
        case currency = "Currency"
        case description = "Description"
        case rebillFlag = "RebillFlag"
        case customerInfo = "CustomerInfo"
        case extraData = "ExtraData"
        case paymentMethod = "PaymentMethod"
        case receiptData = "ReceiptData"
        case paymentDetails = "PaymentDetails"
    }
}

public enum PaymentMethod: String, Codable {
    case card = "Card"
    case token = "Token"
    case criptogram = "Ctyptogram"
}















