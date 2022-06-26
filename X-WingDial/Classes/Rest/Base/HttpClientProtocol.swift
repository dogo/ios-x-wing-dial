//
//  HttpClientProtocol.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/06/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

protocol HttpClientProtocol {
    var logger: NetworkingLogger { get }

    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void)

    func cancelAllRequests()
}

extension HttpClientProtocol {
    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        self.request(request, decode: decode, completion: completion)
    }
}
