//
//  PaymentFormData.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 4.11.22.
//

import Foundation

public struct PaymentFormData {
    
    public var amount: String
    public var currency: Currency
    public var cardNumber: String
    public var cardExpMonth: String
    public var cardExpYear: String
    public var cardHolderName: String
    public var cvc: String
    public var messageExpiration: String
    public var orderId: String
    public var description: String
    public var customerInfo: CustomerInfo
    
    public init(amount: String,
                currency: Currency,
                cardNumber: String,
                cardExpMonth: String,
                cardExpYear: String,
                cardHolderName: String,
                cvc: String,
                messageExpiration: String,
                orderId: String,
                description: String,
                customerInfo: CustomerInfo) {
        self.amount = amount
        self.currency = currency
        self.cardNumber = cardNumber
        self.cardExpMonth = cardExpMonth
        self.cardExpYear = cardExpYear
        self.cardHolderName = cardHolderName
        self.cvc = cvc
        self.messageExpiration = messageExpiration
        self.orderId = orderId
        self.description = description
        self.customerInfo = customerInfo
    }
}
