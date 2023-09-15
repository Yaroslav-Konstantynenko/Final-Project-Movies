//
//  TopVideoCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 13.09.2023.
//

import UIKit
import Kingfisher

class TopVideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var numberRatingLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var descriptionMovieLabel: UILabel!
    @IBOutlet weak var dataMovieLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurCell()
    }

    func updateDataMovie(model: Result) {
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        let formatDouble = String(format: "%.1f", model.voteAverage)
        
        numberRatingLabel.text = formatDouble
        titleMovieLabel.text = model.originalTitle
        descriptionMovieLabel.text = model.overview
        dataMovieLabel.text = model.releaseDate
    }
    
    private func configurCell() {
//        mainView.layer.cornerRadius = 6
        ratingView.layer.cornerRadius = 6
        mainImageView.layer.cornerRadius = 6
        descriptionView.layer.cornerRadius = 5
    }
}
