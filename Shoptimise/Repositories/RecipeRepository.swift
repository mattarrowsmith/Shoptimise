//
//  RecipeRepository.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 22/03/2023.
//

import Foundation
import Combine

protocol RecipeRepository
{
    func loadRecipes() -> [Recipe]
}

//This is the same implementation as ShoppingLists
//TODO use template to load any type from JSON
struct RecipeLocalRepository: RecipeRepository
{
    func loadRecipes() -> [Recipe] {
        let data: Data
        let filename = "recipes.json"

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Recipe].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Recipe.self):\n\(error)")
        }
    }
}
