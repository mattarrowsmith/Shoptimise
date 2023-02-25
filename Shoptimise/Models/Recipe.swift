//
//  Recipe.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation
extension ShoppingList {
    struct Recipe: Equatable {
        let name: String
        let ingredients: [Ingredient]
    }
}
