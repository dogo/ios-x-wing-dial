//
//  FactionsPresenter.swift
//  X-WingDialTests
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

final class FactionsPresenter {

    weak var controller: FactionsViewControllerType?
    private let service: XWingServiceProtocol

    init(service: XWingServiceProtocol = XWingService()) {
        self.service = service
    }
}

extension FactionsPresenter: FactionsPresenterType {

    func fetchFactionAndShips() {
        service.fetchFactions { [weak self] result in
            switch result {
            case let .success(data):
                self?.controller?.updateSetList(with: data)
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}

protocol FactionsPresenterType {
    var controller: FactionsViewControllerType? { get set }
    func fetchFactionAndShips()
}

protocol FactionsViewControllerType: AnyObject {
    func updateSetList(with data: XWing)
}
