//
//  DialMovesView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 24/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class DialMovesView: UIView {

    private let actionsView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .center
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

    func setup(with data: [String]) {

        let dialMovements = Dictionary(grouping: data) { $0.prefix(1) }.sorted { $0.key > $1.key }

        for (_, value) in dialMovements {

            let stackView = createHorizontalStackView()

            value.forEach {
                let actionLabel = UILabel(frame: .zero)
                actionLabel.text = $0.trimmingCharacters(in: .whitespacesAndNewlines)
                actionLabel.textColor = .white
                actionLabel.textAlignment = .center
                stackView.addArrangedSubview(actionLabel)
            }
            actionsView.addArrangedSubview(stackView)
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

extension DialMovesView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(actionsView)
    }

    func setupConstraints() {

        actionsView.layout.applyConstraint {
            $0.centerYAnchor(equalTo: self.centerYAnchor)
            $0.centerXAnchor(equalTo: self.centerXAnchor)
        }
    }

    func configureViews() {
        backgroundColor = ColorPalette.appTertiary.color
    }
}
