//
//  RealmManegerBookmarks.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 20.09.2023.
//

import Foundation
import RealmSwift

class RealmManegerBookmarks {
    
    static var shered = RealmManegerBookmarks()
    private init() {}
    
    var realm = try? Realm()
    
    //MARK: Realm
    
    // Save post in Realm
    func savePost(_ saveTitle: String) {
        let title = ModelRealmBookMarks()
        title.title = saveTitle
        
        try? realm?.write {
            realm?.add(title)
        }
    }
    
    // Add new post in ModelRealmBookMarks
    func getPost() -> [ModelRealmBookMarks] {
        var title: [ModelRealmBookMarks] = []
        
        guard let titleResults = realm?.objects(ModelRealmBookMarks.self) else {
            return []
        }
        
        for newTitle in titleResults {
            title.append(newTitle)
        }
        return title
    }
    
    // Delete post in ModelRealmBookMarks
    func deletePost(title: ModelRealmBookMarks) {
        try? realm?.write {
            realm?.delete(title)
        }
    }
}

