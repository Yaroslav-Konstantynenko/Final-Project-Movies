//
//  BookmarksViewController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    @IBOutlet weak var bookmarksTableView: UITableView!
    
    var bookmarksSaveList: [ModelRealmBookMarks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.customColorGradientMainView()
        registerBookmarksCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePost()
    }
    
    private func updatePost() {
        bookmarksSaveList = RealmManegerBookmarks.shered.getPost()
        bookmarksTableView.reloadData()
    }
    
    func registerBookmarksCell() {
        bookmarksTableView.register(UINib(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookmarksTableViewCell")
    }
}

