//
//  ExtensionTv.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit

extension TvViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTvScreenCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cellAllTv = collectionView.dequeueReusableCell(withReuseIdentifier: "AllTvCollectionViewCell", for: indexPath) as? AllTvCollectionViewCell else { return UICollectionViewCell() }
        
        let modelAllTv = allTvScreenCollection[indexPath.row]
        cellAllTv.updateAllTvCell(model: modelAllTv)
        
        return cellAllTv
    }
}

extension TvViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = main.instantiateViewController(withIdentifier: "ScreenPresentViewController") as? ScreenPresentViewController {
            
            vc.mainimage = allTvScreenCollection[indexPath.row].backdropPath
            vc.maintitle = allTvScreenCollection[indexPath.row].originalName
            vc.raiting = allTvScreenCollection[indexPath.row].voteAverage
            vc.releas = allTvScreenCollection[indexPath.row].firstAirDate
            vc.descriptionMovie = allTvScreenCollection[indexPath.row].overview
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TvViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 300)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
}
