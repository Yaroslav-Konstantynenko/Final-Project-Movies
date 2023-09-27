//
//  RealmManegerTv.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit
import RealmSwift

class RealmManegerTv {
    
    static var shered = RealmManegerTv()
    private init() {}
    
    var realm = try? Realm()
    
    // Save TV in Realm
    func saveRealmTv(_ value: TopTv) {
        let tv = ModelRealmTv()
        
        tv.title = value.name
        tv.mainImage = value.backdropPath
        tv.id = value.id
        tv.rating = value.voteAverage
        tv.overview = value.overview
        tv.releasData = value.firstAirDate
        tv.media = value.mediaType
        
        try? realm?.write {
            realm?.add(tv)
        }
    }
    
    // Add new TV in ModelRealmTv
    func getRealmTv() -> [ModelRealmTv] {
        var tv: [ModelRealmTv] = []
        
        guard let tvResults = realm?.objects(ModelRealmTv.self) else { return [] }
        
        for newTv in tvResults {
            tv.append(newTv)
        }
        return tv
    }
    
    // Delete TV in ModelRealmTv
    func deleteMovie(tv: ModelRealmTv) {
        try? realm?.write {
            realm?.delete(tv)
        }
    }
}

