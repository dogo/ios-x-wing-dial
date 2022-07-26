//
//  StarshipStatsView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import UIKit

final class StarshipStatsView: UIView {

    private let statIconLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = FontFamily.XWingSymbols.wingSymbols.font(size: 20)
        label.textAlignment = .center
        return label
    }()

    private let statValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .right
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

    func setup(with data: Stat) {
        statIconLabel.text = "\(data.arc?.symbol ?? data.type.symbol)"
        statIconLabel.textColor = data.type.tintColor
        statValueLabel.text = data.value.description
        statValueLabel.textColor = data.type.tintColor
    }
}

extension StarshipStatsView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(statIconLabel)
        addSubview(statValueLabel)
    }

    func setupConstraints() {

        statIconLabel.layout.applyConstraint {
            $0.topAnchor(equalTo: self.topAnchor)
            $0.leadingAnchor(equalTo: self.leadingAnchor)
            $0.bottomAnchor(equalTo: self.bottomAnchor)
        }

        statValueLabel.layout.applyConstraint {
            $0.leadingAnchor(equalTo: self.statIconLabel.trailingAnchor, constant: 4)
            $0.centerYAnchor(equalTo: self.statIconLabel.centerYAnchor)
            $0.trailingAnchor(equalTo: self.trailingAnchor)
        }
    }

    func configureViews() {
        backgroundColor = ColorPalette.appTertiary.color
    }
}
