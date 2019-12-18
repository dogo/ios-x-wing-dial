//
//  DialView.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class DialView: UIView {

    private let dialPath: String

    private var dialImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        return image
    }()

    init(with dialPath: String) {
        self.dialPath = dialPath
        super.init(frame: .zero)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DialView: BaseViewConfiguration {

    func buildViewHierarchy() {
        self.addSubview(dialImage)
    }

    func setupConstraints() {
        dialImage.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.centerYAnchor)
            view.centerXAnchor(equalTo: self.centerXAnchor)
        }
    }

    func configureViews() {
        dialImage.image = UIImage(named: "\(dialPath)_dial")
        backgroundColor = .white
    }
}
