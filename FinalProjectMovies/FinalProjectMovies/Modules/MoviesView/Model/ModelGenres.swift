//
//  ModelAllMovies.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 15.09.2023.
//

import UIKit

// MARK: - Welcome
struct ModelGenres: Codable {
    let genres: [Genres]
}

// MARK: - Genre
struct Genres: Codable {
    let id: Int
    let name: String
}

