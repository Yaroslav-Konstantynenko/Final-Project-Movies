//
//  Extension.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 17.09.2023.
//

import UIKit

extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == genresCollectionView {
            return moviesGenresScrrenCollection.count
        } else {
            return allMoviesScrrenCollection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == genresCollectionView {
            guard let cellGenres = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresCollectionViewCell", for: indexPath) as? GenresCollectionViewCell else { return UICollectionViewCell() }
            
            let modelGenres = moviesGenresScrrenCollection[indexPath.row]
            cellGenres.updateGenresCell(model: modelGenres)
            
            return cellGenres
            
        } else {
            guard let cellAllMovies = collectionView.dequeueReusableCell(withReuseIdentifier: "AllMoviesCollectionViewCell", for: indexPath) as? AllMoviesCollectionViewCell else { return UICollectionViewCell() }
            
            let modeAllMovie = allMoviesScrrenCollection[indexPath.row]
            cellAllMovies.updateAllMovies(model: modeAllMovie)
            
            return cellAllMovies
        }
    }
}

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = main.instantiateViewController(withIdentifier: "ScreenPresentViewController") as? ScreenPresentViewController {
            
            vc.mainimage = allMoviesScrrenCollection[indexPath.row].backdropPath
            vc.maintitle = allMoviesScrrenCollection[indexPath.row].originalTitle
            vc.raiting = allMoviesScrrenCollection[indexPath.row].voteAverage
            vc.releas = allMoviesScrrenCollection[indexPath.row].releaseDate
            vc.descriptionMovie = allMoviesScrrenCollection[indexPath.row].overview
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == genresCollectionView {
            return CGSize(width: 70, height: 25)
        } else {
            return CGSize(width: 320, height: 200)
        }
    }
}
