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
    private var sections: [Faction] = []
    private var starships: [Faction: [Ship]] = [ : ]

    required init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        tableView.register(cellType: FactionsTableCell.self)
        tableView.register(headerFooterViewType: FactionHeaderView.self)
        self.tableView?.sectionIndexColor = .gray
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }

    func updateDatasource(_ data: XWing) {
        sections = SectionsBuilder.factions(data.factions)
        starships = Split.starshipsByFaction(data.factions)
        self.tableView?.reloadData()
    }

    func getFaction(at index: IndexPath) -> Ship? {
        return (starships[sections[index.section]]?[index.row])
    }
}

extension FactionsDatasource: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = starships[sections[section]] else {
            return 0
        }
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FactionsTableCell.self)
        if let faction = getFaction(at: indexPath) {
            cell.configureCell(with: faction)
        }
        return cell
    }
}

extension FactionsDatasource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(FactionHeaderView.self)
        header?.configureHeader(with: sections[section])
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 53
    }
}
