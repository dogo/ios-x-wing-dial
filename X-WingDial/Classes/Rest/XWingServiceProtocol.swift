//
//  XWingServiceProtocol.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

protocol XWingServiceProtocol {

    func fetchFactions(completion: @escaping (Result<XWing, APIError>) -> Void)

    func fetchPilots(faction: String, starship: String, completion: @escaping (Result<Starship, APIError>) -> Void)

    func cancelAllRequests()
}
