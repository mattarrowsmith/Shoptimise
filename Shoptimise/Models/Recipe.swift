//
//  Recipe.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation

struct Recipe: Equatable {
    let name: String
    let ingredients: [Ingredient]
}

extension Recipe {
    struct Ingredient: Equatable {
        let name: String
        let price: Double
    }
}
