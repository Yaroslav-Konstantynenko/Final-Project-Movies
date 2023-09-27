//
//  MoviesViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var allMoviesCollectionView: UICollectionView!
    
    var moviesGenresScrrenCollection: [Genres] = []
    var allMoviesScrrenCollection: [AllMovies] = []
    
    var moviesGanresId: [AllMovies] = []
    
    var idGenres = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientMainView()
        registerCell()
        fetchMoview()
    }
    
    private func fetchMoview() {
        GetNetworkData.shered.getGenresMovies { result in
            switch result {
            case .success(let ganre):
                self.moviesGenresScrrenCollection = ganre
                self.genresCollectionView.reloadData()
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію Genres: \(error)")
            }
        }
        
        GetNetworkData.shered.getAllMovies { result in
            switch result {
            case .success(let allMovies):
                self.allMoviesScrrenCollection = allMovies
                self.allMoviesCollectionView.reloadData()
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію AllMovies: \(error)")
            }
        }
    }
    
    private func registerCell() {
        genresCollectionView.register(UINib(nibName: "GenresCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenresCollectionViewCell")
        
        allMoviesCollectionView.register(UINib(nibName: "AllMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllMoviesCollectionViewCell")
    }
}

