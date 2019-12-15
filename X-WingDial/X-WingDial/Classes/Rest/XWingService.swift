//
//  XWingService.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol XWingService {

    func fetchStarships(faction: String, completion: @escaping (Result<[Starship]?, APIError>) -> Void)

    func fetchPilots(starship: String, completion: @escaping (Result<[Pilot]?, APIError>) -> Void)

    func cancelAllRequests()
}
