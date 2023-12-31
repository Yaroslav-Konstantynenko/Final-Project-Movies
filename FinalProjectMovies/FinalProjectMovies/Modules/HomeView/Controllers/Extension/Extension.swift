//
//  Extension.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 14.09.2023.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == moviesCollectionView {
            return homeScreenMoviesCollection.count
            
        } else {
            return homeScreenTvCollection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopVideoCollectionViewCell", for: indexPath) as? TopVideoCollectionViewCell else { return UICollectionViewCell() }
        
        if collectionView == moviesCollectionView {
            let modelMovies = homeScreenMoviesCollection[indexPath.row]
            cell.updateDataMovieDay(model: modelMovies)
            
            return cell
            
        } else {
            let modelTv = homeScreenTvCollection[indexPath.row]
            cell.updateDataTvDay(model: modelTv)
            
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 190)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = main.instantiateViewController(withIdentifier: "ScreenPresentViewController") as? ScreenPresentViewController {
            
            if collectionView == moviesCollectionView {
                vc.mainimage = homeScreenMoviesCollection[indexPath.row].mainImage
                vc.maintitle = homeScreenMoviesCollection[indexPath.row].title
                vc.raiting = homeScreenMoviesCollection[indexPath.row].rating
                vc.releas = homeScreenMoviesCollection[indexPath.row].releasData
                vc.descriptionMovie = homeScreenMoviesCollection[indexPath.row].overview
                vc.idMovies = homeScreenMoviesCollection[indexPath.row].id
                vc.media = homeScreenMoviesCollection[indexPath.row].media
                
                navigationController?.pushViewController(vc, animated: true)
                
            } else {
                vc.mainimage = homeScreenTvCollection[indexPath.row].mainImage
                vc.maintitle = homeScreenTvCollection[indexPath.row].title
                vc.raiting = homeScreenTvCollection[indexPath.row].rating
                vc.releas = homeScreenTvCollection[indexPath.row].releasData
                vc.descriptionMovie = homeScreenTvCollection[indexPath.row].overview
                vc.idMovies = homeScreenTvCollection[indexPath.row].id
                vc.media = homeScreenTvCollection[indexPath.row].media
                
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
