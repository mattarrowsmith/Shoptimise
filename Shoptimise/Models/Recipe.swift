//
//  Recipe.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation

struct Recipe: Equatable, Hashable, Codable {
    let name: String
    let ingredients: [Ingredient]
    let imageUrl: URL
}

extension Recipe {
    struct Ingredient: Equatable, Hashable, Codable {
        let name: String
        let price: Double
    }
}
