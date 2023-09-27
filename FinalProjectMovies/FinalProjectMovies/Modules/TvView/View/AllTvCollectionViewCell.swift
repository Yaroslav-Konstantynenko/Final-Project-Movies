//
//  AllTvCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit
import Kingfisher

class AllTvCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var reitingView: UIView!
    @IBOutlet private weak var reintingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCell()
    }
    
    func updateAllTvCell(model: TvWeek) {
        titleLabel.text = model.name
        
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        let formatDouble = String(format: "%.1f", model.voteAverage)
        reintingLabel.text = formatDouble
    }
    
    private func configureCell() {
        mainView.layer.cornerRadius = 10
        mainImageView.layer.cornerRadius = 10
        titleView.layer.cornerRadius = 10
        reitingView.layer.cornerRadius = 10
        reintingLabel.layer.cornerRadius = 10
    }
}
