//
//  ModelTv.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 18.09.2023.
//

import Foundation
import RealmSwift

class ModelRealmTv: Object {
    @objc dynamic var title = ""
    @objc dynamic var mainImage = ""
    @objc dynamic var id = 0.0
    @objc dynamic var releasData = ""
    @objc dynamic var rating = ""
    @objc dynamic var overview = ""
}
