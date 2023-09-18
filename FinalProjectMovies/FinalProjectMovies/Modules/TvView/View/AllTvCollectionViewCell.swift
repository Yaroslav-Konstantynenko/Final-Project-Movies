//
//  AllTvCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit
import Kingfisher

class AllTvCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reitingView: UIView!
    @IBOutlet weak var reintingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
        titleLabel.text = nil
        reintingLabel.text = nil
    }
    
    func updateAllTvCell(model: TvWeek) {
        let formatDouble = String(format: "%.1f", model.voteAverage)
        
        let posterPath = model.backdropPath
        let urlString = Constant.network.defaultImagePath + posterPath
        mainImageView.kf.setImage(with: URL(string: urlString))
        
        titleLabel.text = model.originalName
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
