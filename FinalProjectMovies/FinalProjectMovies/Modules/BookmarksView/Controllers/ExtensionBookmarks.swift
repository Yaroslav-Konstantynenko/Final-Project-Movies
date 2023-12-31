//
//  ExtensionBookmarks.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarksSaveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as? BookmarksTableViewCell else { return UITableViewCell() }
        
        let list = bookmarksSaveList[indexPath.row]
        cell.titleLabel.text = list.title
        
        return cell
    }
}

extension BookmarksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    //Delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Remove post from Realm
            let title = bookmarksSaveList[indexPath.row]
            RealmManegerBookmarks.shered.deletePost(title: title)
            
            //Remove post from TableView
            bookmarksSaveList.remove(at: indexPath.row)
            bookmarksTableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    // Move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = bookmarksSaveList[sourceIndexPath.row]
        bookmarksSaveList.remove(at: sourceIndexPath.row)
        bookmarksSaveList.insert(item, at: destinationIndexPath.row)
    }
}

