//
//  XWingService.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

final class XWingService: XWingServiceProtocol {

    private let client: HttpClientProtocol

    init(client: HttpClientProtocol = HttpClient()) {
        self.client = client
    }

    func fetchFactions(completion: @escaping (Result<XWing, APIError>) -> Void) {
        let endpoint: XWingEndpoint = .factions
        let request = endpoint.request

        client.request(request, completion: completion)
    }

    func fetchPilots(faction: String, starship: String, completion: @escaping (Result<Starship, APIError>) -> Void) {
        let endpoint: XWingEndpoint = .pilots(faction, starship)
        let request = endpoint.request

        client.request(request, completion: completion)
    }

    func cancelAllRequests() {
        client.cancelAllRequests()
    }
}
