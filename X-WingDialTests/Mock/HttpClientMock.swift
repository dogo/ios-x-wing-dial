//
//  HttpClientMock.swift
//  X-WingDialTests
//
//  Created by Diogo Autilio on 02/09/23.
//  Copyright © 2023 Diogo Autilio. All rights reserved.
//

import Foundation

@testable import X_WingDial

final class HttpClientMock: HttpClientProtocol {
    var fileName = String()
    var error: Bool = false
    var isCancelled = false

    var logger: NetworkingLogger {
        return NetworkingLogger(level: .none)
    }

    func request<T: Decodable>(_ request: URLRequest, decode: T.Type) async throws -> T {
        guard !error else {
            throw APIError.jsonParsingFailure
        }

        let decodable: T = JSONHelper.loadJSON(withFile: fileName)!
        return decodable
    }

    func cancelAllRequests() {
        isCancelled = true
    }
}
