//
//  PilotDetailsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class PilotDetailsView: UIView {

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let abilityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()

    private let initiativeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    private let shipAbilityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
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

    func setup(with data: Pilot) {
        var name = "\(data.name)"
        if let caption = data.caption {
            name.append(" - \(caption)")
        }

        nameLabel.text = name
        abilityLabel.text = data.ability
        initiativeLabel.text = "Initiative: \(data.initiative.description)"

        if let shipAbility = data.shipAbility {
            shipAbilityLabel.text = "\(shipAbility.name) \(shipAbility.text)"
        }
    }

    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }
}

extension PilotDetailsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(nameLabel)
        addSubview(detailsStackView)
        detailsStackView.addArrangedSubview(abilityLabel)
        detailsStackView.addArrangedSubview(initiativeLabel)
        detailsStackView.addArrangedSubview(shipAbilityLabel)
    }

    func setupConstraints() {

        nameLabel.layout.applyConstraint {
            $0.topAnchor(equalTo: self.topAnchor, constant: 8)
            $0.leadingAnchor(equalTo: self.leadingAnchor, constant: 8)
            $0.trailingAnchor(equalTo: self.trailingAnchor, constant: -8)
        }

        detailsStackView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.nameLabel.bottomAnchor, constant: 16)
            $0.leadingAnchor(equalTo: self.leadingAnchor, constant: 8)
            $0.trailingAnchor(equalTo: self.trailingAnchor, constant: -8)
            $0.bottomAnchor(equalTo: self.bottomAnchor, constant: -8)
        }
    }

    func configureViews() {
        backgroundColor = ColorPalette.appTertiary.color
        layer.borderWidth = 1.5
        layer.borderColor = ColorPalette.appSeconday.color.cgColor
        layer.cornerRadius = 12
    }
}
