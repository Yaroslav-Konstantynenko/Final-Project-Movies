//
//  Constant.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 12.09.2023.
//

import Foundation

struct Constant {
    
    struct network {
        static let apiKey = "?api_key=331e07208d153f576f7451e4777990f2"
        
        static let baseUrlMovie = "https://api.themoviedb.org/3/"
        
        static let popularMovieWeek = "trending/movie/week"
        static let popularMoviDay = "trending/movie/day"
        
        static let popularTvDay = "trending/tv/day"
        static let popularTvWeek = "trending/tv/week"
        
        
        static let defaultImagePath = "https://image.tmdb.org/t/p/original/"
    }
}
