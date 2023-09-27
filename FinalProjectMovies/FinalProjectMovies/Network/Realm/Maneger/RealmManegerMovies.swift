//
//  RealmManeger.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import UIKit
import RealmSwift

class RealmManegerMovies {
    
    static var shered = RealmManegerMovies()
    private init() {}
    
    var realm = try? Realm()
    
    // Save Movie in ModelRealmMovies
    func saveRealmMovies(_ value: TopMovies) {
        let movie = ModelRealmMovies()
        
        movie.title = value.title
        movie.mainImage = value.backdropPath
        movie.id = value.id
        movie.rating = value.voteAverage
        movie.overview = value.overview
        movie.releasData = value.releaseDate
        movie.media = value.mediaType
        
        try? realm?.write {
            realm?.add(movie)
        }
    }
    
    // Add new Movie in ModelRealmMovies
    func getRealmMovies() -> [ModelRealmMovies] {
        var movie: [ModelRealmMovies] = []
        
        guard let movieResults = realm?.objects(ModelRealmMovies.self) else { return [] }
        
        for newMovies in movieResults {
            movie.append(newMovies)
        }
        return movie
    }
    
    func clearAllMovies() {
           try? realm?.write {
               realm?.deleteAll()
           }
       }
    
    // Delete Movie in ModelRealmMovies
    func deleteMovie(movie: ModelRealmMovies) {
        try? realm?.write {
            realm?.delete(movie)
        }
    }
}

