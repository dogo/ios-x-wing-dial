//
//  XWingServiceImpl.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

final class XWingServiceImpl: XWingService {

    let api: XWingService

    init(api: XWingService = XWingAPI()) {
        self.api = api
    }

    func fetchStarships(faction: String, completion: @escaping (Result<[Starship]?, APIError>) -> Void) {
        return self.api.fetchStarships(faction: faction, completion: completion)
    }

    func fetchPilots(starship: String, completion: @escaping (Result<[Pilot]?, APIError>) -> Void) {
        return self.api.fetchPilots(starship: starship, completion: completion)
    }

    func cancelAllRequests() {
        self.api.cancelAllRequests()
    }
}
