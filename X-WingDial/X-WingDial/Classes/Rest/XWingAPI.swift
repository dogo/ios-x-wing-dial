//
//  XWingAPI.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

final class XWingAPI: APIClient, XWingService {

    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetchFactions(completion: @escaping (Result<XWing?, APIError>) -> Void) {

        let endpoint: XWingRoute = .factions
        let request = endpoint.request

        self.request(request, decode: { json -> XWing? in
            guard let result = json as? XWing else { return nil }
            return result
        }, completion: completion)
    }

    func fetchPilots(faction: String, starship: String, completion: @escaping (Result<Starship?, APIError>) -> Void) {

        let endpoint: XWingRoute = .pilots(faction, starship)
        let request = endpoint.request

        self.request(request, decode: { json -> Starship? in
            guard let result = json as? Starship else { return nil }
            return result
        }, completion: completion)
    }

    func cancelAllRequests() {
        self.cancel()
    }
}
