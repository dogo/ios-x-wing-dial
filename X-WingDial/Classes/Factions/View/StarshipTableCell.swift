//
//  FactionsTableCell.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit
import Kingfisher

final class StarshipTableCell: UITableViewCell, Identifiable {

    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func configureCell(with faction: Ship) {
        titleLabel.text = faction.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // just hightlight
    }
}

extension StarshipTableCell: BaseViewConfiguration {

    internal func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
    }

    internal func setupConstraints() {
        titleLabel.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 12)
        }
    }

    internal func configureViews() {
        accessoryType = .disclosureIndicator
    }
}
