//
//  TvViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

class TvViewController: UIViewController {
    
    @IBOutlet weak var allTvCollectionView: UICollectionView!
    
    var allTvScreenCollection: [TvWeek] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        tegisterCell()
        
        GetNetworkData.shered.getAllTv { result in
            switch result {
            case .success(let tv):
                self.allTvScreenCollection = tv
                self.allTvCollectionView.reloadData()
            case .failure(let error):
                print("Помилка, данні не додалися в колекцію All TV: \(error)")
            }
        }
    }
    
    private func tegisterCell() {
        allTvCollectionView.register(UINib(nibName: "AllTvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllTvCollectionViewCell")
    }
}
