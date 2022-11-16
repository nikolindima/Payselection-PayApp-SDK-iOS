//
//  NetworkError.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 20.10.22.
//

import Foundation

public enum PayselectionError: Error {
    case transportError(Error)
    case serverError(statusCode: Int, message: ServerError?)
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case notFound
    case unknownError
    case invalidURL
    case invalidResponse
    case encryptionError
}
