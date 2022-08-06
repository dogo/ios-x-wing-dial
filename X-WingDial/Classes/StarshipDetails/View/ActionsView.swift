//
//  ActionsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 06/08/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation
import UIKit

final class ActionsView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 4
        alignment = .center
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with action: Action) {
        let horizontalActionsView = horizontalActionsView()
        let actionLabel = buildActionLabel(with: action.difficulty, type: action.type)
        horizontalActionsView.addArrangedSubview(actionLabel)

        if let linked = action.linked {
            let actionLabel = buildActionLabel(with: linked.difficulty, type: linked.type)
            horizontalActionsView.addArrangedSubview(separatorView())
            horizontalActionsView.addArrangedSubview(actionLabel)
        }

        addArrangedSubview(horizontalActionsView)
    }

    private func buildActionLabel(with difficulty: ActionDifficulty, type: ActionType) -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = FontFamily.XWingSymbols.wingSymbols.font(size: 20)
        label.textAlignment = .center
        label.text = type.symbol
        label.textColor = difficulty.tintColor
        return label
    }

    private func horizontalActionsView() -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }

    private func separatorView() -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12)
        label.text = ">"
        label.textColor = .white
        return label
    }
}
