//
//  HomeViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var tvColllectionView: UICollectionView!
    
    var homeScreenMoviesCollection: [TopMovies] = []
    var homeScreenTvCollection: [TopTv] = []
    
    var moviesTopWeek: [AllMovies] = []
    var tvTopWeek: [TvWeek] = []
    
    var saveMovies: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientMainView()
        registerCell()
        
        GetNetworkData.shered.getTrendingMoviesDay { result in
            switch result {
            case .success(let movies):
                self.homeScreenMoviesCollection = movies
                self.moviesCollectionView.reloadData()
                
//                saveMovies = RealmManegerMovies.shered.saveRealmMovies(movies)
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію Movies: \(error)")
            }
        }
        
        GetNetworkData.shered.getTrendingTvDay { result in
            switch result {
            case .success(let tv):
                self.homeScreenTvCollection = tv
                self.tvColllectionView.reloadData()
                
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію TV: \(error)")
            }
        }
    }
    
    @IBAction func dayWeekSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            GetNetworkData.shered.getTrendingMoviesDay { result in
                switch result {
                case .success(let movies):
                    self.homeScreenMoviesCollection = movies
                    self.moviesCollectionView.reloadData()
                    
    //                saveMovies = RealmManegerMovies.shered.saveRealmMovies(movies)
                    
                case .failure(let error):
                    print("Помилка, данні не додалися в колекцію Movies: \(error)")
                }
            }
            
            GetNetworkData.shered.getTrendingTvDay { result in
                switch result {
                case .success(let tv):
                    self.homeScreenTvCollection = tv
                    self.tvColllectionView.reloadData()
                    
                case .failure(let error):
                    print("Помилка, данні не додалися в колекцію TV: \(error)")
                }
            }
            
        case 1:
            GetNetworkData.shered.getAllMovies { result in
                switch result {
                case .success(let movie):
                    self.moviesTopWeek = movie
                    self.moviesCollectionView.reloadData()
                case .failure(let error):
                    print("Помилка, данні не додалися в колекцію Movies: \(error)")
                }
            }
            
            GetNetworkData.shered.getAllTv { result in
                switch result {
                case .success(let tv):
                    self.tvTopWeek = tv
                    self.tvColllectionView.reloadData()
                case .failure(let error):
                    print("Помилка, данні не додалися в колекцію TV: \(error)")
                }
            }
            
        default:
            return
        }
    }
    
    
    private func registerCell() {
        moviesCollectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
        tvColllectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
    }
}
