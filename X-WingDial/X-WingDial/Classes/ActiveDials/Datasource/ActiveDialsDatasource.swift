//
//  ActiveDialsDatasource.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit
import Reusable

final class ActiveDialsDatasource: NSObject, UICollectionViewDataSource {

    private var collectionView: UICollectionView?

    required init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        collectionView.register(cellType: ActiveDialCollectionCell.self)
        self.collectionView?.dataSource = self
        self.collectionView?.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ActiveDialCollectionCell.self)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
}

