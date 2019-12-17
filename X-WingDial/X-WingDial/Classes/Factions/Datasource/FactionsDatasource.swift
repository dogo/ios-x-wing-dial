//
//  FactionsDatasource.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class FactionsDatasource: NSObject {

    private var tableView: UITableView?

    var factions: [Faction] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }

    required init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        tableView.register(cellType: FactionsTableCell.self)
        self.tableView?.dataSource = self
    }

    func updateDatasource(_ data: XWing) {
        factions = data.factions
    }
}

extension FactionsDatasource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FactionsTableCell.self)
        cell.configureCell(faction: factions[indexPath.row])
        return cell
    }
}
