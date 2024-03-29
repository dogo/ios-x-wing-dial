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

    private let stackView = {
        let stack = UIStackView(frame: .zero)
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()

    private let starshipImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let actionsView: ActionsView = {
        let stackView = ActionsView(frame: .zero)
        return stackView
    }()

    private let statsView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillEqually
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
        starshipImage.kf.setImage(with: data.icon)
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
        actions.forEach { action in
            actionsView.setup(with: action)
        }
    }

    private func setupStarshipStats(_ stats: [Stat]) {
        stats.forEach {
            let view = StarshipStatsView(frame: .zero)
            view.setup(with: $0)
            statsView.addArrangedSubview(view)
        }
    }
}

extension StarshipDetailsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(starshipImage)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(actionsView)
        stackView.addArrangedSubview(statsView)
        stackView.addArrangedSubview(dialMovesView)
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

        starshipImage.layout.applyConstraint {
            $0.topAnchor(equalTo: self.containerView.topAnchor, constant: 16)
            $0.centerXAnchor(equalTo: self.containerView.centerXAnchor)
        }

        stackView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.starshipImage.bottomAnchor)
            $0.leadingAnchor(equalTo: containerView.leadingAnchor, constant: 16)
            $0.trailingAnchor(equalTo: containerView.trailingAnchor, constant: -16)
        }

        pilotDetailsView.layout.applyConstraint {
            $0.topAnchor(equalTo: self.stackView.bottomAnchor, constant: 16)
            $0.leadingAnchor(equalTo: self.containerView.leadingAnchor, constant: 16)
            $0.trailingAnchor(equalTo: self.containerView.trailingAnchor, constant: -16)
            $0.bottomAnchor(equalTo: self.containerView.bottomAnchor, constant: -16)
        }
    }

    func configureViews() {
        backgroundColor = ColorPalette.appTertiary.color
    }
}
