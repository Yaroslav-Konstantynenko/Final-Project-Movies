//
//  GalleryColectionView.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 12.09.2023.
//

import UIKit

class GalleryColectionView: UICollectionView {
    let cellsPresent = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension UICollectionView: UICollectionViewDelegate {
    
}
