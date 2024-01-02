//
//  HomeViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit
import Alamofire
import SystemConfiguration

class HomeViewController: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var tvColllectionView: UICollectionView!
    
    var homeScreenMoviesCollection: [ModelRealmMovies] = []
    var homeScreenTvCollection: [ModelRealmTv] = []
    
    var segmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientMainView()
        registerCell()
        if GetNetworkData.shered.isInternetAvailable() {
            print("Internet Connect")
            fetchMoview()
        } else {
            print("No connect Internet")
        }
    }
    
    private func fetchMoview() {
        GetNetworkData.shered.getTrendingMoviesDay { result in
            switch result {
            case .success(let movies):
                RealmManegerMovies.shered.clearAllMovies()
                
                for value in movies {
                    RealmManegerMovies.shered.saveRealmMovies(value)
                }
                
                self.homeScreenMoviesCollection = RealmManegerMovies.shered.getRealmMovies()
                self.moviesCollectionView.reloadData()
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію Movies: \(error)")
            }
        }
        
        GetNetworkData.shered.getTrendingTvDay { result in
            switch result {
            case .success(let tv):
                for value in tv {
                    RealmManegerTv.shered.saveRealmTv(value)
                }
                
                self.homeScreenTvCollection = RealmManegerTv.shered.getRealmTv()
                self.tvColllectionView.reloadData()
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію TV: \(error)")
            }
        }
    }
    
    private func registerCell() {
        moviesCollectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
        
        tvColllectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
    }
}
