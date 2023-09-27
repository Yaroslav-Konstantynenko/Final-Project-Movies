//
//  BookmarksTableViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var backgroundLabelView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        mainView.layer.cornerRadius = 5
        mainView.layer.cornerRadius = 5
        backgroundLabelView.layer.cornerRadius = 5
    }
}
