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

    func fetchFactionAndShips() async {
        do {
            let data = try await service.fetchFactions()
            await MainActor.run {
                controller?.updateSetList(with: data)
            }
        } catch {
            debugPrint("[fetchFactionAndShips] Failure: ", error.localizedDescription)
        }
    }
}

protocol FactionsPresenterType {
    var controller: FactionsViewControllerType? { get set }
    func fetchFactionAndShips() async
}

protocol FactionsViewControllerType: AnyObject {
    func updateSetList(with data: XWing)
}
