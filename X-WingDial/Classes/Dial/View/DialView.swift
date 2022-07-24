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
        image.isUserInteractionEnabled = true
        return image
    }()

    private var dialSelector: UIImageView = {
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

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touches.first, touch.view === dialImage {
            let position = touch.location(in: self)
            let target = dialImage.center
            let angle = atan2(target.y - position.y, target.x - position.x)
            dialImage.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
}

extension DialView: BaseViewConfiguration {

    func buildViewHierarchy() {
        addSubview(dialImage)
        addSubview(dialSelector)
    }

    func setupConstraints() {
        dialImage.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.centerYAnchor)
            view.centerXAnchor(equalTo: self.centerXAnchor)
        }

        dialSelector.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.centerYAnchor, constant: -92)
            view.centerXAnchor(equalTo: self.centerXAnchor)
        }
    }

    func configureViews() {
        dialSelector.image = Asset.dialSelector.image
        dialImage.image = UIImage(named: "\(dialPath)_dial")
        backgroundColor = .white
    }
}
