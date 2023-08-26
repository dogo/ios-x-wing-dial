//
//  StarshipDetailsViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class StarshipDetailsViewController: UIViewController {

    private var presenter: StarshipDetailsPresenterType
    private let ship: Ship
    private let faction: String
    private let starshipDetailsView = StarshipDetailsView()

    // MARK: - Life Cycle

    init(presenter: StarshipDetailsPresenterType = StarshipDetailsPresenter(), faction: String, ship: Ship) {
        self.presenter = presenter
        self.faction = faction
        self.ship = ship
        super.init(nibName: nil, bundle: nil)
        self.presenter.controller = self
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = starshipDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await presenter.fetchFactionAndShips(faction: faction, ship: ship.path)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = ship.title
    }
}

extension StarshipDetailsViewController: StarshipDetailsViewControllerType {

    func setup(with data: Starship) {
        starshipDetailsView.setup(with: data)
    }
}
