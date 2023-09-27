//
//  ModelMovies.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import Foundation
import RealmSwift

class ModelRealmMovies: Object {
    @objc dynamic var title = ""
    @objc dynamic var mainImage = ""
    @objc dynamic var id = 0
    @objc dynamic var releasData = ""
    @objc dynamic var rating = 0.0
    @objc dynamic var overview = ""
    @objc dynamic var media = ""
}
