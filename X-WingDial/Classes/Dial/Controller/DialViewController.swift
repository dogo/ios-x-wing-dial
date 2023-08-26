//
//  DialViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class DialViewController: UIViewController {

    private let service: XWingServiceProtocol
    private let ship: Ship
    private let faction: String

    private lazy var dialView: DialView = {
        let view = DialView(with: ship.path)
        return view
    }()

    // MARK: - Life Cycle

    init(service: XWingServiceProtocol = XWingService(), faction: String, ship: Ship) {
        self.service = service
        self.faction = faction
        self.ship = ship
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = dialView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await fetchStarShipPilot()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = ship.title
    }

    private func fetchStarShipPilot() async {
        do {
            let data = try await service.fetchPilots(faction: faction, starship: ship.path)
            debugPrint("[fetchPilots] Success")
        } catch {
            debugPrint("[fetchPilots] Failure: ", error.localizedDescription)
        }
    }
}
