//
//  BaseViewConfiguration.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation
import SketchKit

protocol BaseViewConfiguration {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension BaseViewConfiguration {

    func setupBaseView() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() {
    }
}
