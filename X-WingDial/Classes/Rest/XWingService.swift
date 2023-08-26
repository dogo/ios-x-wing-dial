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

    func fetchFactions() async throws -> XWing {
        let endpoint: XWingEndpoint = .factions
        let request = endpoint.request

        return try await client.request(request, decode: XWing.self)
    }

    func fetchPilots(faction: String, starship: String) async throws -> Starship {
        let endpoint: XWingEndpoint = .pilots(faction, starship)
        let request = endpoint.request

        return try await client.request(request, decode: Starship.self)
    }

    func cancelAllRequests() {
        client.cancelAllRequests()
    }
}
