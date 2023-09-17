//
//  CollectionView.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 17.09.2023.
//

import UIKit

extension UICollectionView {
    
    func settingConstraintsCell(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
