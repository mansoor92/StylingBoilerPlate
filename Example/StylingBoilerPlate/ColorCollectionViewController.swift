//
//  ColorCollectionViewController.swift
//  Managin Bundles
//
//  Created by Incubasys on 11/07/2017.
//  Copyright © 2017 Incubasys. All rights reserved.
//

import UIKit
import StylingBoilerPlate

class ColorCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var colorsInfoArray = ColorInfo.allColorsInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return colorsInfoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colorInfo = colorsInfoArray[indexPath.item]

        let cell = collectionView.dequeCell(indexPath: indexPath) as ColorCollectionViewCell
        cell.config(colorInfo: colorInfo)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.view.frame.size.width - 24)/2
        return CGSize(width: w, height: w+40)
    }
}
