//
//  AllMoviesCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit
import Kingfisher

class AllMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var raitingView: UIView!
    
    @IBOutlet weak var titleView: UIView!

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
        mainView.layer.cornerRadius = 10
        mainImageView.layer.cornerRadius = 10
        reitingLabel.layer.cornerRadius = 10
        titleView.layer.cornerRadius = 10
        raitingView.layer.cornerRadius = 10
    }
}
