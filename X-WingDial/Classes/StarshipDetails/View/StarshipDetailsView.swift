//
//  StarshipDetailsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class StarshipDetailsView: UIView {

    private let scrollView = UIScrollView(frame: .zero)
    private let containerView = UIView(frame: .zero)

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

    private let pilotDetailsView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
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
        setupStarshipActions(data.actions)
        setupStarshipStats(data.stats)
        setupStarshipPilots(data.pilots)
        dialMovesView.setup(with: data.dial)
    }

    private func setupStarshipPilots(_ pilots: [Pilot]) {

        pilots.forEach {
            let view = PilotDetailsView(frame: .zero)
            view.setup(with: $0)
            pilotDetailsView.addArrangedSubview(view)
        }
    }

    private func setupStarshipActions(_ actions: [Action]) {

        actions.forEach {
            let actionLabel = UILabel(frame: .zero)
            actionLabel.text = $0.type
            actionLabel.textColor = $0.difficulty.color
            actionsView.addArrangedSubview(actionLabel)
        }
    }

    private func setupStarshipStats(_ stats: [Stat]) {

        stats.forEach {
            let actionLabel = UILabel(frame: .zero)
            actionLabel.text = "\($0.type.capitalized) \($0.value)"
            actionLabel.textColor = .white
            statsView.addArrangedSubview(actionLabel)
        }
    }
}

extension StarshipDetailsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(shipImage)
        containerView.addSubview(actionsView)
        containerView.addSubview(statsView)
        containerView.addSubview(dialMovesView)
        containerView.addSubview(pilotDetailsView)
    }

    func setupConstraints() {

        scrollView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.safeTopAnchor)
            $0.leadingAnchor(equalTo: self.leadingAnchor)
            $0.trailingAnchor(equalTo: self.trailingAnchor)
            $0.bottomAnchor(equalTo: self.safeBottomAnchor)
        }

        containerView.layout.applyConstraint {
            $0.topAnchor(equalTo: scrollView.topAnchor)
            $0.leadingAnchor(equalTo: scrollView.leadingAnchor)
            $0.trailingAnchor(equalTo: scrollView.trailingAnchor)
            $0.bottomAnchor(equalTo: scrollView.bottomAnchor)
            $0.widthAnchor(equalTo: scrollView.widthAnchor)
        }

        shipImage.layout.applyConstraint {
            $0.topAnchor(equalTo: self.containerView.topAnchor, constant: 16)
            $0.leadingAnchor(equalTo: self.containerView.leadingAnchor, constant: 16)
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
            $0.leadingAnchor(equalTo: self.containerView.leadingAnchor)
            $0.trailingAnchor(equalTo: self.containerView.trailingAnchor)
        }

        pilotDetailsView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.dialMovesView.bottomAnchor, constant: 64)
            $0.leadingAnchor(equalTo: self.containerView.leadingAnchor, constant: 16)
            $0.trailingAnchor(equalTo: self.containerView.trailingAnchor, constant: -16)
            $0.bottomAnchor(equalTo: self.containerView.bottomAnchor, constant: -16)
        }
    }

    func configureViews() {
        backgroundColor = ColorName.appTertiary.color
    }
}
