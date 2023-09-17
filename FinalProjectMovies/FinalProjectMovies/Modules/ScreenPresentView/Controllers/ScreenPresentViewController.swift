//
//  ScreenPresentViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit
import Kingfisher

final class ScreenPresentViewController: UIViewController {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var dataReleaseLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var raitingView: UIView!
    @IBOutlet private weak var dadaReleaseView: UIView!
    @IBOutlet private weak var descriptionView: UIView!
    
    var mainimage: String = ""
    var maintitle: String = ""
    var raiting: Double = 0.0
    var releas: String = ""
    var descriptionMovie: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        
        configurePresentView()
        getDataScreenViewController()
        
    }
    
    private func getDataScreenViewController() {
        let urlString = Constant.network.defaultImagePath + mainimage
        let formatDouble = String(format: "%.1f", raiting)
        
        mainImageView.kf.setImage(with: URL(string: urlString))
        titleLabel.text = maintitle
        ratingLabel.text = "\(formatDouble)"
        dataReleaseLabel.text = releas
        descriptionLabel.text = descriptionMovie
    }
    
    private func configurePresentView() {
        mainImageView.layer.cornerRadius = 5
        
        titleLabel.layer.cornerRadius = 5
        titleView.layer.cornerRadius = 5
        
        raitingView.layer.cornerRadius = 5
        ratingLabel.layer.cornerRadius = 5
        
        dadaReleaseView.layer.cornerRadius = 5
        dataReleaseLabel.layer.cornerRadius = 5
        
        descriptionView.layer.cornerRadius = 5
        descriptionLabel.layer.cornerRadius = 5
    }
}
