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
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    
    @IBOutlet weak var dayWeekSegmentedControl: UISegmentedControl!
    
    var homeScreenMoviesCollection: [ModelMovies] = []
    var homeScreenTvCollection: [ModelMovies] = []
    var homeScreenSeriesCollection: [ModelMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        registerCell()
        getTrendingMoviesDay()
        //getTrendingTvDay()
        
        moviesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tvColllectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        seriesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func registerCell() {
        moviesCollectionView.register(UINib(nibName: "TopVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopVideoCollectionViewCell")
    }
    
    func getTrendingMoviesDay() {
        let urlMovies = Constant.network.baseUrlMovie + "trending/movie/day" + Constant.network.apiKey
        
        AF.request(urlMovies).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                if let data = response.data {
                    do {
                        let movie = try decoder.decode(ModelMovies.self, from: data)
                        self.homeScreenMoviesCollection.append(movie)
                        //print(movie)
                        print("Працює !")
                    } catch {
                        print("Помилка декодування: \(error)")
                    }
                }
                
            case .failure(let error):
                print("Помилка запиту: \(error)")
            }
        }
    }
}
