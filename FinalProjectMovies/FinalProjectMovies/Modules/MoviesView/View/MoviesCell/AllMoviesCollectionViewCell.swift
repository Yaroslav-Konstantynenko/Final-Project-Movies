//
//  AllMoviesCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit
import Kingfisher

class AllMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var seveMovieButton: UIButton!
    @IBOutlet private weak var reitingView: UIView!
    @IBOutlet private weak var reitingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurAllMovies()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
        titleLabel.text = nil
        reitingLabel.text = nil
    }
    
    func updateAllMovies(model: AllMovies) {
        let formatDouble = String(format: "%.1f", model.voteAverage)
        
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        titleLabel.text = model.originalTitle
        reitingLabel.text = formatDouble
    }
    
    private func configurAllMovies() {
        mainImageView.layer.cornerRadius = 10
        reitingView.layer.cornerRadius = 60
        seveMovieButton.layer.cornerRadius = 8
    }
}
