//
//  DialViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class DialViewController: UIViewController {

    private let api = XWingAPI()
    private let ship: Ship
    private let faction: String

    private lazy var dialView: DialView = {
        let view = DialView(with: ship.path)
        return view
    }()

    // MARK: - Life Cycle

    init(with faction: String, ship: Ship) {
        self.faction = faction
        self.ship = ship
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = dialView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        api.fetchPilots(faction: faction, starship: ship.path) { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ship.title
    }
}
