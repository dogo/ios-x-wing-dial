//
//  XWingRoute.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol Endpoint {

    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String]? { get }
}

enum XWingRoute {
    case factions
    case pilots(_ faction: String, _ starship: String)
}

extension XWingRoute: Endpoint {

    /// The target's base `URL`.
    var baseURL: String {
        return "https://djogopatrao.github.io"
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .factions:
            return "/xwing_data/ships.json"
        case .pilots(let faction, let starship):
            return "/xwing_dial/data/pilots/\(faction)/\(starship).json"
        }
    }

    /// The HTTP method used in the request.
    var method: HttpMethod {
        switch self {
        case .factions, .pilots:
            return .get
        }
    }

    /// The headers to be used in the request.
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    /// The components of a URL.
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseURL)! // swiftlint:disable:this force_unwrapping
        components.path = path
        return components
    }

    /// The URLRequest with the given URL and httpMethod.
    var request: URLRequest {
        var request = URLRequest(url: urlComponents.url!) // swiftlint:disable:this force_unwrapping
        request.httpMethod = method.toString()
        request.allHTTPHeaderFields = headers
        return request
    }
}
