//
//  CardDetails.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct CardDetails: Codable {
    
    public var cardNumber: String
    public var expMonth: String
    public var expYear: String
    public var cardholderName: String
    public var cvc: String
    
    enum CodingKeys: String, CodingKey {
        case cardNumber = "CardNumber"
        case expMonth = "ExpMonth"
        case expYear = "ExpYear"
        case cardholderName = "CardholderName"
        case cvc = "CVC"
    }
}
