//
//  GenresCollectionViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var mainContentView: UIView!
    @IBOutlet private weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configurCell()
    }
    
    func updateGenresCell(model: Genres) {
        titleLable.text = model.name
    }
    
    private func configurCell() {
        mainContentView.layer.cornerRadius = 10
        mainContentView.customColorGradientRed()
    }
}
