//
//  FactionsTableView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class FactionsTableView: UITableView {

    var didSelectSet: ((XWing) -> Void)?

    private var tableViewDatasource: FactionsDatasource?

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        tableViewDatasource = FactionsDatasource(tableView: self)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateSetList(_ xwing: XWing) {
        tableViewDatasource?.updateDatasource(xwing)
    }

    // MARK: - <BaseDelegate>

    internal func didSelectRowAt(index: IndexPath) {
        //didSelectSet?(set)
    }
}

extension FactionsTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt(index: indexPath)
    }
}
