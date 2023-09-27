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
            if idGenres != 0 {
                return moviesGanresId.count
            } else {
                return allMoviesScrrenCollection.count
            }
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
            
            if idGenres != 0 {
                let modeAllMovie = moviesGanresId[indexPath.row]
                cellAllMovies.updateAllMovies(model: modeAllMovie)
                
            } else {
                let modeAllMovie = allMoviesScrrenCollection[indexPath.row]
                cellAllMovies.updateAllMovies(model: modeAllMovie)
            }
            return cellAllMovies
        }
    }
}

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if collectionView == allMoviesCollectionView {
            if let vc = main.instantiateViewController(withIdentifier: "ScreenPresentViewController") as? ScreenPresentViewController {
                
                if idGenres != 0 {
                    vc.mainimage = moviesGanresId[indexPath.row].backdropPath
                    vc.maintitle = moviesGanresId[indexPath.row].title
                    vc.raiting = moviesGanresId[indexPath.row].voteAverage
                    vc.releas = moviesGanresId[indexPath.row].releaseDate
                    vc.descriptionMovie = moviesGanresId[indexPath.row].overview
                    vc.idMovies = moviesGanresId[indexPath.row].id
                    vc.media = moviesGanresId[indexPath.row].mediaType
                    
                    navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    vc.mainimage = allMoviesScrrenCollection[indexPath.row].backdropPath
                    vc.maintitle = allMoviesScrrenCollection[indexPath.row].title
                    vc.raiting = allMoviesScrrenCollection[indexPath.row].voteAverage
                    vc.releas = allMoviesScrrenCollection[indexPath.row].releaseDate
                    vc.descriptionMovie = allMoviesScrrenCollection[indexPath.row].overview
                    vc.idMovies = allMoviesScrrenCollection[indexPath.row].id
                    vc.media = allMoviesScrrenCollection[indexPath.row].mediaType
                    
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        } else {
            idGenres = moviesGenresScrrenCollection[indexPath.row].id
            
            var newArray: [AllMovies] = []
            
            for ganre in allMoviesScrrenCollection {
                if ganre.genreIDS.contains(idGenres) {
                    newArray.append(ganre)
                }
            }
            self.moviesGanresId = newArray
            allMoviesCollectionView.reloadData()
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == genresCollectionView {
            return CGSize(width: 70, height: 25)
            
        } else {
            return CGSize(width: 350, height: 300)
        }
    }
}
