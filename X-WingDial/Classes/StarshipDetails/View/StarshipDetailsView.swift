//
//  StarshipDetailsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class StarshipDetailsView: UIView {

    private let shipImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let actionsView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
    }()

    private let statsView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
    }()

    private let dialMovesView: DialMovesView = {
        let view = DialMovesView(frame: .zero)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with data: Starship) {
        shipImage.kf.setImage(with: data.icon)

        data.actions.forEach {
            let actionLabel = UILabel(frame: .zero)
            actionLabel.text = $0.type
            actionLabel.textColor = $0.difficulty.color
            actionsView.addArrangedSubview(actionLabel)
        }

        data.stats.forEach {
            let actionLabel = UILabel(frame: .zero)
            actionLabel.text = "\($0.type.capitalized) \($0.value)"
            actionLabel.textColor = .white
            statsView.addArrangedSubview(actionLabel)
        }

        dialMovesView.setup(with: data.dial)
    }
}

extension StarshipDetailsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(shipImage)
        addSubview(actionsView)
        addSubview(statsView)
        addSubview(dialMovesView)
    }

    func setupConstraints() {

        shipImage.layout.applyConstraint {
            $0.topAnchor(equalTo: self.safeTopAnchor, constant: 16)
            $0.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
        }

        actionsView.layout.applyConstraint {
            $0.centerYAnchor(equalTo: self.shipImage.centerYAnchor)
            $0.leadingAnchor(equalTo: self.shipImage.trailingAnchor, constant: 16)
        }

        statsView.layout.applyConstraint {
            $0.centerYAnchor(equalTo: self.shipImage.centerYAnchor)
            $0.leadingAnchor(equalTo: self.actionsView.trailingAnchor, constant: 16)
        }

        dialMovesView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.shipImage.bottomAnchor, constant: 32)
            $0.leadingAnchor(equalTo: self.leadingAnchor)
            $0.trailingAnchor(equalTo: self.trailingAnchor)
        }
    }

    func configureViews() {
        backgroundColor = ColorName.appTertiary.color
    }
}
