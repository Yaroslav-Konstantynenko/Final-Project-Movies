//
//  TopVideoCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 13.09.2023.
//

import UIKit
import Kingfisher

class TopVideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var ratingView: UIView!
    @IBOutlet private weak var numberRatingLabel: UILabel!
    @IBOutlet private weak var descriptionView: UIView!
    @IBOutlet private weak var titleMovieLabel: UILabel!
    @IBOutlet private weak var descriptionMovieLabel: UILabel!
    @IBOutlet private weak var dataMovieLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurCell()
    }
    
    func updateDataMovieDay(model: TopMovies) {
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        let formatDouble = String(format: "%.1f", model.voteAverage)
        
        numberRatingLabel.text = formatDouble
        titleMovieLabel.text = model.originalTitle
        descriptionMovieLabel.text = model.overview
        dataMovieLabel.text = model.releaseDate
    }
    
    func updateDataTvDay(model: TopTv) {
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        let formatDouble = String(format: "%.1f", model.voteAverage)
        
        numberRatingLabel.text = formatDouble
        titleMovieLabel.text = model.originalName
        descriptionMovieLabel.text = model.overview
        dataMovieLabel.text = model.firstAirDate
        
    }
    
    private func configurCell() {
        ratingView.layer.cornerRadius = 6
        mainImageView.layer.cornerRadius = 6
        descriptionView.layer.cornerRadius = 5
    }
}
