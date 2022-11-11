//
//  File.swift
//  
//
//  Created by Alexander Kogalovsky on 11.11.22.
//

import Foundation

extension Bundle {
    class var payselectionPayAppMain: Bundle {
        let bundle = Bundle.init(for: Encryptor.self)
        let bundleUrl = bundle.url(forResource: "PayselectionPayAppSDK", withExtension: "bundle")
        return Bundle.init(url: bundleUrl!)!
    }
}
