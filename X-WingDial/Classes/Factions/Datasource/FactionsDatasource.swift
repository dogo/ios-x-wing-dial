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
    private var starships: [Faction: [Ship]] = [:]
    private weak var baseDelegate: BaseDelegate?

    required init(tableView: UITableView, baseDelegate: BaseDelegate) {
        super.init()
        self.tableView = tableView
        tableView.register(cellType: StarshipTableCell.self)
        tableView.register(headerFooterViewType: FactionHeaderView.self)
        self.tableView?.sectionIndexColor = .gray
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.baseDelegate = baseDelegate
    }

    func updateDatasource(_ data: XWing) {
        sections = SectionsBuilder.factions(data.factions)
        starships = Split.starshipsByFaction(data.factions)
        tableView?.reloadData()
    }

    func getShip(at index: IndexPath) -> Ship? {
        return starships[sections[index.section]]?[index.row]
    }

    func getFaction(at index: IndexPath) -> Faction {
        return sections[index.section]
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
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: StarshipTableCell.self)
        if let ship = getShip(at: indexPath) {
            cell.configureCell(with: ship)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        baseDelegate?.didSelectRowAt(indexPath)
    }
}
