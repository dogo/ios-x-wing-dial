//
//  FactionsViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

class FactionsViewController: UIViewController {

    private let api = XWingAPI()
    private let factionsView = FactionsTableView()

    override func loadView() {
        self.view = factionsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFactionAndShips()

        factionsView.didSelectShip = { [weak self] faction, ship in
            self?.navigationController?.pushViewController(DialViewController(with: faction.path, ship: ship), animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = L10n.xWingCompanion
    }

    private func fetchFactionAndShips() {
        api.fetchFactions { [weak self] result in
            switch result {
            case .success(let data):
                self?.factionsView.updateSetList(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
