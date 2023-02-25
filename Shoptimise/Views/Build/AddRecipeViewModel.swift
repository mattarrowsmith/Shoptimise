//
//  AddRecipeViewModel.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation
@MainActor class AddRecipeViewModel: ObservableObject {
    
    @Published var title: String
    @Published var Recipes: [Recipe]
    
    init(title: String, Recipes: [Recipe]) {
        self.title = title
        self.Recipes = Recipes
    }
    
    init() {
        self.title = "Add Recipe"
        self.Recipes = AddRecipeViewModel.createDummyList()
    }

    static func createDummyList() -> [Recipe] {
        let ingredient = Recipe.Ingredient(name: "Potato", price: 1.5)
        let ingredient2 = Recipe.Ingredient(name: "Oil", price: 1)
        
        let ingredient3 = Recipe.Ingredient(name: "Lettuce", price: 0.80)
        let ingredient4 = Recipe.Ingredient(name: "Patty", price: 2.50)
        let ingredient5 = Recipe.Ingredient(name: "Bun", price: 1.10)
        let ingredient6 = Recipe.Ingredient(name: "Potato", price: 0.30)
        
        let recipe = Recipe(name: "Chips", ingredients: [ingredient, ingredient2], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!) //set a default url somewhere instead of picsum
        let recipe2 = Recipe(name: "Burgers", ingredients: [ingredient3, ingredient4, ingredient5, ingredient6], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!) //set a default url somewhere instead of picsum
        let recipeListDummy = [recipe, recipe2]
        
        return recipeListDummy
    }
}
