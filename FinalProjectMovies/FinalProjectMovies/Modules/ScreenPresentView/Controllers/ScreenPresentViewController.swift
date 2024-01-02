//
//  ScreenPresentViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 16.09.2023.
//

import UIKit
import Kingfisher
import YouTubeiOSPlayerHelper

class ScreenPresentDescriptionViewController: UIViewController {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var dataReleaseLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var mainSaveView: UIView!
    @IBOutlet private weak var saveInsideView: UIView!
    
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var raitingView: UIView!
    @IBOutlet private weak var dadaReleaseView: UIView!
    @IBOutlet private weak var descriptionView: UIView!
    
    @IBOutlet private weak var videoPlayerView: YTPlayerView!
    
    var mainimage: String = ""
    var maintitle: String = ""
    var raiting: Double = 0.0
    var releas: String = ""
    var descriptionMovie: String = ""
    var media: String = ""
    
    // Video player
    var idMovies: Int = 0
    var keyVideo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientMainView()
        configurePresentView()
        getDataScreenViewController()
        getVideoLoad()
    }
    
    @IBAction func saveMovieButtonAction(_ sender: Any) {
        RealmManegerBookmarks.shered.savePost(maintitle)
        
        let alert = UIAlertController(title: "Фільм успішно збережено 🍿",
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func playVideoButtonAction(_ sender: Any) {
        videoPlayerView.load(withVideoId: keyVideo)
    }
    
    private func getVideoLoad() {
        GetNetworkData.shered.getLoadVideoMovie(movieId: idMovies, type: media) { result in
            switch result {
            case .success(let key):
                self.keyVideo = key.first?.key ?? "No Key !!!"
            case .failure(let error):
                print("Помилка данні для відео не прийшли: \(error)")
            }
        }
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
        
        mainSaveView.layer.cornerRadius = 5
        saveInsideView.layer.cornerRadius = 5
        
        raitingView.layer.cornerRadius = 5
        ratingLabel.layer.cornerRadius = 5
        
        dadaReleaseView.layer.cornerRadius = 5
        dataReleaseLabel.layer.cornerRadius = 5
        
        descriptionView.layer.cornerRadius = 7
        descriptionLabel.layer.cornerRadius = 7
    }
}
