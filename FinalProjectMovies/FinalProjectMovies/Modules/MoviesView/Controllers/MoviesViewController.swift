//
//  MoviesViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit
import Kingfisher
import Alamofire

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var imageTest: UIImageView!
    var moviesTop: [ModelMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        
        
        
        let urlMovies = Constant.network.baseUrlMovie + "trending/movie/week" + Constant.network.apiKey
        
        AF.request(urlMovies).responseJSON { response in
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                if let data = response.data {
                    do {
                        let movie = try decoder.decode(ModelMovies.self, from: data)
                        self.moviesTop.append(movie)
                        //print(movie)
                        print("Work data")
                    } catch {
                        print("Помилка декодування: \(error)")
                    }
                }
                
            case .failure(let error):
                print("Помилка запиту: \(error)")
            }
        }
        
        if let posterPath = self.moviesTop.first?.results.first?.backdropPath {
            let urlString = Constant.network.defaultImagePath + posterPath
         
            imageTest.kf.setImage(with: URL(string: urlString))
        }
    }
}
