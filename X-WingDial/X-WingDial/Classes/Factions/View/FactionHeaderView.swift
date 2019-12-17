//
//  FactionHeaderView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

final class FactionHeaderView: UITableViewHeaderFooterView, Reusable {

    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    var factionImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func configureHeader(with faction: Faction) {
        titleLabel.text = faction.name
        factionImageView.kf.setImage(with: faction.icon)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        factionImageView.image = nil
    }
}

extension FactionHeaderView: BaseViewConfiguration {

    func buildViewHierarchy() {
        contentView.addSubview(factionImageView)
        contentView.addSubview(titleLabel)
    }

    func setupConstraints() {
        factionImageView.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 12)
            view.heightAnchor(equalTo: 35)
            view.widthAnchor(equalTo: 35)
        }

        titleLabel.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
            view.leadingAnchor(equalTo: factionImageView.trailingAnchor, constant: 12)
        }
    }
}
