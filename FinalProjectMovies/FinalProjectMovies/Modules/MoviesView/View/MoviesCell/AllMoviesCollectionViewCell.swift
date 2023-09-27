//
//  AllMoviesCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit
import Kingfisher

class AllMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var raitingView: UIView!
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var reitingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurAllMovies()
    }
    
    func updateAllMovies(model: AllMovies) {
        titleLabel.text = model.originalTitle
        
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        let formatDouble = String(format: "%.1f", model.voteAverage)
        reitingLabel.text = formatDouble
    }
    
    private func configurAllMovies() {
        mainView.layer.cornerRadius = 10
        mainImageView.layer.cornerRadius = 10
        reitingLabel.layer.cornerRadius = 10
        titleView.layer.cornerRadius = 10
        raitingView.layer.cornerRadius = 10
    }
}
