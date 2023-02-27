//
//  RecipeModel.swift
//  Food Fate
//
//  Created by Mario Tromba on 19/01/23.
//

import Foundation


struct RecipeData: Decodable {
    let results: [Recipe]
}

struct Recipe: Decodable {
    let id: Int
    let title: String
    let image: String
}
