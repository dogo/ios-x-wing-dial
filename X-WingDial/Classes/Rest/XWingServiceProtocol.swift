//
//  XWingServiceProtocol.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol XWingServiceProtocol {

    func fetchFactions() async throws -> XWing

    func fetchPilots(faction: String, starship: String) async throws -> Starship

    func cancelAllRequests()
}
