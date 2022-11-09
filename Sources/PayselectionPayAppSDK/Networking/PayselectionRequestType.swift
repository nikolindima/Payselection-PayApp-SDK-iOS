//
//  PayselectionRequestType.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 20.10.22.
//

import Foundation

protocol PayselectionRequestType {
    associatedtype ResponseType: Codable
    var data: PayselectionRequest { get }
}

extension PayselectionRequestType {
    func execute(dispatcher: PayselectionNetworkDispatcher = PayselectionURLSessionNetworkDispatcher.shared,
                 keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                 onSuccess: @escaping (ResponseType) -> Void,
                 onError: @escaping (Error) -> Void,
                 onRedirect: ((URLRequest) -> Bool)? = nil) {
        dispatcher.dispatch(
            request: self.data,
            onSuccess: { data, response in
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
                
                guard let response = response as? HTTPURLResponse else {
                    DispatchQueue.main.async {
                        onError(PayselectionError.unknownError)
                    }
                    return
                }
                do {
                    switch response.statusCode {
                    case 200...299:
                        let result = try jsonDecoder.decode(ResponseType.self, from: data)
                        DispatchQueue.main.async {
                            onSuccess(result)
                        }
                    case 400, 403, 409, 500:
                        let message = try jsonDecoder.decode(ServerError.self, from: data)
                        DispatchQueue.main.async {
                            onError(PayselectionError.serverError(statusCode: response.statusCode,
                                                             message: message))
                        }
                    case 404:
                        DispatchQueue.main.async {
                            onError(PayselectionError.notFound)
                        }
                    default:
                        DispatchQueue.main.async {
                            onError(PayselectionError.serverError(statusCode: response.statusCode,
                                                             message: nil))
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        if error is DecodingError {
                            onError(PayselectionError.decodingError(error))
                        } else {
                            onError(error)
                        }
                    }
                }
            },
            onError: { error in
                DispatchQueue.main.async {
                    onError(error)
                }
            }, onRedirect: onRedirect
        )
    }
}
