//
//  StarshipDetailsPresenter.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

final class StarshipDetailsPresenter {

    weak var controller: StarshipDetailsViewControllerType?
    private let service: XWingServiceProtocol

    init(service: XWingServiceProtocol = XWingService()) {
        self.service = service
    }
}

extension StarshipDetailsPresenter: StarshipDetailsPresenterType {

    func fetchFactionAndShips(faction: String, ship: String) {
        service.fetchPilots(faction: faction, starship: ship) { [weak self] result in
            switch result {
            case let .success(data):
                self?.controller?.setup(with: data)
            case let .failure(error):
                debugPrint("[fetchPilots] Failure: ", error.localizedDescription)
            }
        }
    }
}

protocol StarshipDetailsPresenterType {
    var controller: StarshipDetailsViewControllerType? { get set }
    func fetchFactionAndShips(faction: String, ship: String)
}

protocol StarshipDetailsViewControllerType: AnyObject {
    func setup(with data: Starship)
}
