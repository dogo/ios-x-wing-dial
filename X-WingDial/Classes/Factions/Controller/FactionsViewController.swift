//
//  FactionsViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class FactionsViewController: UIViewController {

    private let service: XWingServiceProtocol
    private let factionsView = FactionsTableView()

    // MARK: - Life Cycle

    init(service: XWingServiceProtocol = XWingService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = factionsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFactionAndShips()

        factionsView.didSelectShip = { [weak self] faction, ship in
            let controller = DialViewController(faction: faction.path, ship: ship)
            self?.navigationController?.pushViewController(controller, animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = L10n.xWingCompanion
    }

    private func fetchFactionAndShips() {
        service.fetchFactions { [weak self] result in
            switch result {
            case .success(let data):
                self?.factionsView.updateSetList(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
