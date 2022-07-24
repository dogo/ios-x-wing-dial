//
//  ActiveDialsDatasource.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 22/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import UIKit

final class ActiveDialsDatasource: NSObject, UICollectionViewDataSource {

    private var collectionView: UICollectionView?

    private var data = [Ship]() {
        didSet {
            collectionView?.reloadData()
        }
    }

    required init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        collectionView.register(cellType: ActiveDialCollectionCell.self)
        self.collectionView?.dataSource = self
        self.collectionView?.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ActiveDialCollectionCell.self)
        cell.setup(with: "K-Wing")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}
