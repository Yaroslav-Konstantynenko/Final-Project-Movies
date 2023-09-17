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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        registerCell()
        
        GetNetworkData.shered.getTrendingMoviesDay { result in
            switch result {
            case .success(let movies):
                self.homeScreenMoviesCollection = movies
                self.moviesCollectionView.reloadData()
                
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
    
    @IBAction func dayWeekSegmentedControl(_ sender: Any) {
        
    }
    
    private func registerCell() {
        moviesCollectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
        tvColllectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
    }
}
