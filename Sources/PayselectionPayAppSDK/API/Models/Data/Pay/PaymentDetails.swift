//
//  PaymentDetails.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct PaymentDetails: Codable {
    public var type: PaymentDetailsType
    public var payToken: String
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case payToken = "PayToken"
    }
}

public enum PaymentDetailsType: String, Codable {
    case `internal` = "Internal"
}
