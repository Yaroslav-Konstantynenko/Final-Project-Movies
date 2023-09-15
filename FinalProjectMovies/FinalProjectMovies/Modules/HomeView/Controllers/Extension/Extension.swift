//
//  Extension.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 14.09.2023.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "TopVideoCollectionViewCell", for: indexPath) as? TopVideoCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        if let model = homeScreenMoviesCollection.first?.results[indexPath.row] {
            cell.updateDataMovie(model: model)
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}
