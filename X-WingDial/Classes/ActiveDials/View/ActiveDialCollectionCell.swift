//
//  ActiveDialCollectionCell.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class ActiveDialCollectionCell: UICollectionViewCell, Identifiable {

    private let dialImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = Asset.btlS8KWingDial.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let title: UILabel = {
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
        dialImageView.layout.applyConstraint {
            $0.topAnchor(equalTo: contentView.topAnchor)
            $0.leadingAnchor(equalTo: contentView.leadingAnchor)
            $0.trailingAnchor(equalTo: contentView.trailingAnchor)
            $0.widthAnchor(equalToConstant: 180)
            $0.heightAnchor(equalToConstant: 180)
        }

        title.layout.applyConstraint {
            $0.topAnchor(equalTo: dialImageView.bottomAnchor)
            $0.leadingAnchor(equalTo: contentView.leadingAnchor)
            $0.trailingAnchor(equalTo: contentView.trailingAnchor)
            $0.bottomAnchor(equalTo: contentView.bottomAnchor)
        }
    }

    func configureViews() {}
}
