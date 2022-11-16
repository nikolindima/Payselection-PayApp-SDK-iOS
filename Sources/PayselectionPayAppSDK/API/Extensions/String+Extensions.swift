//
//  File.swift
//  
//
//  Created by Alexander Kogalovsky on 16.11.22.
//

import Foundation

extension String {
    func toBase64() -> String {
        Data(self.utf8).base64EncodedString()
    }
}
