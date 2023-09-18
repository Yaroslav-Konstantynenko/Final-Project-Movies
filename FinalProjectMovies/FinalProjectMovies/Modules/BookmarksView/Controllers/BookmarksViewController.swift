//
//  BookmarksViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    @IBOutlet weak var bookmarksTableView: UITableView!
    var bookmarksSaveList: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.customColorGradientGreen()
        registerBookmarksCell()
        
    }
    
    func registerBookmarksCell() {
        bookmarksTableView.register(UINib(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookmarksTableViewCell")
    }
}

