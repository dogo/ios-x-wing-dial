//
//  ActiveDialsCollection.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class ActiveDialsCollection: UICollectionView {

    private var collectionViewDatasource: ActiveDialsDatasource?

    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.delegate = self

        self.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)

        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
        }

        collectionViewDatasource = ActiveDialsDatasource(collectionView: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActiveDialsCollection: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let width = collectionSize.width / 2
        let height = collectionSize.height / 3
        return CGSize(width: width, height: height)
    }
}
