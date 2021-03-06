//
//  XWingRoute.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

enum XWingRoute {
    case factions
    case pilots(_ faction: String, _ starship: String)
}

extension XWingRoute: EndpointProtocol {

    /// The scheme subcomponent of the `URL`.
     var scheme: HttpScheme {
         return .https
     }

    /// The target's host `URL`.
    var host: String {
        return "djogopatrao.github.io"
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .factions:
            return "/xwing_data/factions_ships.json"
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
    var headers: HttpHeaders? {
        return ["Content-type": "application/json"]
    }

    /// The components of a URL.
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme.toString()
        components.host = host
        components.path = path
        return components
    }

    /// The URLRequest with the given URL and httpMethod.
    var request: URLRequest {
        var request = URLRequest(with: urlComponents.url)
        request.httpMethod = method.toString()
        request.allHTTPHeaderFields = headers
        return request
    }
}
