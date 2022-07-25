//
//  FactionHeaderView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Kingfisher
import UIKit

final class FactionHeaderView: UITableViewHeaderFooterView, Identifiable {

    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = ColorPalette.textSection.color
        return label
    }()

    private var factionImageView: UIImageView = {
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

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        factionImageView.image = nil
    }

    func configureHeader(with faction: Faction) {
        titleLabel.text = faction.name
        factionImageView.kf.setImage(with: faction.icon)
    }
}

extension FactionHeaderView: BaseViewConfiguration {

    func buildViewHierarchy() {
        contentView.addSubview(factionImageView)
        contentView.addSubview(titleLabel)
    }

    func setupConstraints() {
        factionImageView.layout.applyConstraint {
            $0.centerYAnchor(equalTo: contentView.centerYAnchor)
            $0.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 12)
            $0.heightAnchor(equalToConstant: 35)
            $0.widthAnchor(equalToConstant: 35)
        }

        titleLabel.layout.applyConstraint {
            $0.centerYAnchor(equalTo: contentView.centerYAnchor)
            $0.leadingAnchor(equalTo: factionImageView.trailingAnchor, constant: 12)
        }
    }
}
