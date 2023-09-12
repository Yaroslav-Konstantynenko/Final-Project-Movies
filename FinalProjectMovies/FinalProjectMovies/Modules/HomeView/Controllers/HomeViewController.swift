//
//  HomeViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dayWeekSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientGreen()
        
    }
}
