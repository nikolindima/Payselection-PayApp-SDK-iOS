//
//  CustomerInfo.swift
//  Payselection-PayApp-SDK
//
//  Created by Alexander Kogalovsky on 7.11.22.
//

import Foundation

public struct CustomerInfo: Codable {
    public var email: String?
    public var phone: String?
    public var language: String?
    public var address: String?
    public var town: String?
    public var zip: String?
    public var country: String?
    public var ip: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case phone = "Phone"
        case language = "Language"
        case address = "Address"
        case town = "Town"
        case zip = "Zip"
        case country = "Country"
        case ip = "IP"
    }
    
    public init(email: String? = nil,
                phone: String? = nil,
                language: String? = nil,
                address: String? = nil,
                town: String? = nil,
                zip: String? = nil,
                country: String? = nil,
                ip: String? = nil) {
        self.email = email
        self.phone = phone
        self.language = language
        self.address = address
        self.town = town
        self.zip = zip
        self.country = country
        self.ip = ip
    }
}
