//
//  AddRecipeViewModel.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation
@MainActor class AddRecipeViewModel: ObservableObject {
    
    @Published var title: String
    @Published var recipeCells: [RecipeCell]
    
    init(title: String, recipes: [Recipe]) {
        self.title = title
        self.recipeCells = recipes.map { RecipeCell(recipe: $0.self) }
    }
    
    init() {
        self.title = "Add Recipe"
        self.recipeCells = AddRecipeViewModel.createDummyList().map { RecipeCell(recipe: $0.self) }
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

extension AddRecipeViewModel {
    struct RecipeCell: Identifiable{
        let id = UUID();
        let recipe: Recipe
        
        var isExpanded: Bool
        
        init(recipe: Recipe)
        {
            self.recipe = recipe
            self.isExpanded = false;
        }
    }
}

