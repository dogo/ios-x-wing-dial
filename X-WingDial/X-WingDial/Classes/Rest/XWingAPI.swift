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

    func fetchStarships(faction: String, completion: @escaping (Result<[Starship]?, APIError>) -> Void) {

        let endpoint: XWingRoute = .starships(faction)
        let request = endpoint.request

        self.request(request, decode: { json -> [Starship]? in
            guard let result = json as? [Starship] else { return nil }
            return result
        }, completion: completion)
    }

    func fetchPilots(starship: String, completion: @escaping (Result<[Pilot]?, APIError>) -> Void) {

        let endpoint: XWingRoute = .pilots(starship)
        let request = endpoint.request

        self.request(request, decode: { json -> [Pilot]? in
            guard let result = json as? [Pilot] else { return nil }
            return result
        }, completion: completion)
    }

    func cancelAllRequests() {
        self.cancel()
    }
}
