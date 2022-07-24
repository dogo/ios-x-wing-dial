//
//  FactionsViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class FactionsViewController: UIViewController {

    private var presenter: FactionsPresenterType
    private let factionsView = FactionsTableView()
    private lazy var navigator = FactionsNavigator(self.navigationController)

    // MARK: - Life Cycle

    init(presenter: FactionsPresenterType = FactionsPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.controller = self
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

        presenter.fetchFactionAndShips()

        factionsView.didSelectShip = { [weak self] faction, ship in
            self?.navigator.navigate(to: .dial(path: faction.path, with: ship))
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = L10n.xWingCompanion
    }
}

extension FactionsViewController: FactionsViewControllerType {

    func updateSetList(with data: XWing) {
        factionsView.updateSetList(data)
    }
}
