//
//  ActiveDialsViewController.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class ActiveDialsViewController: UIViewController {

    private let activeDialsView = ActiveDialsCollection()

    override func loadView() {
        view = activeDialsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = L10n.activeDials
    }
}
