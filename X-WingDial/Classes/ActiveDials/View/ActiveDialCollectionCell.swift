//
//  ActiveDialCollectionCell.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit
import Reusable

final class ActiveDialCollectionCell: UICollectionViewCell, Reusable {

    let dialImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = Asset.btlS8KWingDial.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with name: String) {
        title.text = name
    }
}

extension ActiveDialCollectionCell: BaseViewConfiguration {

    func buildViewHierarchy() {
        contentView.addSubview(dialImageView)
        contentView.addSubview(title)
    }

    func setupConstraints() {
        dialImageView.layout.applyConstraint { view in
            view.topAnchor(equalTo: contentView.topAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor)
            view.trailingAnchor(equalTo: contentView.trailingAnchor)
            view.widthAnchor(equalToConstant: 180)
            view.heightAnchor(equalToConstant: 180)
        }

        title.layout.applyConstraint { view in
            view.topAnchor(equalTo: dialImageView.bottomAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor)
            view.trailingAnchor(equalTo: contentView.trailingAnchor)
            view.bottomAnchor(equalTo: contentView.bottomAnchor)
        }
    }

    func configureViews() {
    }
}
