//
//  FactionsTableCell.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Kingfisher
import UIKit

final class StarshipTableCell: UITableViewCell, Identifiable {

    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = ColorName.text.color
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

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // just hightlight
    }

    func configureCell(with faction: Ship) {
        titleLabel.text = faction.title
    }
}

extension StarshipTableCell: BaseViewConfiguration {

    internal func buildViewHierarchy() {
        contentView.addSubview(titleLabel)
    }

    internal func setupConstraints() {
        titleLabel.layout.applyConstraint {
            $0.centerYAnchor(equalTo: contentView.centerYAnchor)
            $0.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 12)
        }
    }

    internal func configureViews() {
        accessoryType = .disclosureIndicator
        backgroundColor = ColorName.appTertiary.color
    }
}
