//
//  FactionsTableView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class FactionsTableView: UITableView {

    var didSelectShip: ((Faction, Ship) -> Void)?

    private var tableViewDatasource: FactionsDatasource?

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.rowHeight = 44.0
        self.sectionHeaderHeight = 53
        tableViewDatasource = FactionsDatasource(tableView: self, baseDelegate: self)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateSetList(_ xwing: XWing) {
        tableViewDatasource?.updateDatasource(xwing)
    }
}

extension FactionsTableView: BaseDelegate {

    func didSelectRowAt(_ index: IndexPath) {
        if let ship = tableViewDatasource?.getShip(at: index),
            let faction = tableViewDatasource?.getFaction(at: index) {
            didSelectShip?(faction, ship)
        }
    }
}
