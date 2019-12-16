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

    func fetchFactions(completion: @escaping (Result<XWing?, APIError>) -> Void) {
        return api.fetchFactions(completion: completion)
    }

    func fetchPilots(faction: String, starship: String, completion: @escaping (Result<Starship?, APIError>) -> Void) {
        return api.fetchPilots(faction: faction, starship: starship, completion: completion)
    }

    func cancelAllRequests() {
        api.cancelAllRequests()
    }
}
