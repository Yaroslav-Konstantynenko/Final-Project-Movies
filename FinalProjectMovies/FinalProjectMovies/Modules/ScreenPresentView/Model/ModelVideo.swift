//
//  ModelVideo.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 19.09.2023.
//

import Foundation

struct MovieVideosKay : Codable {
    
    let id: Int
    let videos: [Video]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case videos = "results"
    }
}

struct Video: Codable {
    
    let iso_639_1 : String
    let iso_3166_1 : String
    let name : String
    let key : String
    let site : String
    let size : Int
    let type : String
    let official : Bool
    let published_at : String
    let id : String
}
