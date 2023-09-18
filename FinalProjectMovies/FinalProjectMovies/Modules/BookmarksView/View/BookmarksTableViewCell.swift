//
//  BookmarksTableViewCell.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var backgroundLabelView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
