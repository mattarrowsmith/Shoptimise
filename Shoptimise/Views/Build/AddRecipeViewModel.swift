//
//  AddRecipeViewModel.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import Foundation
@MainActor class AddRecipeViewModel: ObservableObject {
    
    @Published var title: String
    @Published var Recipes: [ShoppingList.Recipe]
    
    init(title: String, Recipes: [ShoppingList.Recipe]) {
        self.title = title
        self.Recipes = Recipes
    }
    
    static func createDummyList() -> ShoppingList.Recipe {
        let ingredient = ShoppingList.Ingredient(name: "Potato", price: 1.5)
        let ingredient2 = ShoppingList.Ingredient(name: "Oil", price: 1)
        
        let ingredient3 = ShoppingList.Ingredient(name: "Lettuce", price: 0.80)
        let ingredient4 = ShoppingList.Ingredient(name: "Patty", price: 2.50)
        let ingredient5 = ShoppingList.Ingredient(name: "Bun", price: 1.10)
        let ingredient6 = ShoppingList.Ingredient(name: "Potato", price: 0.30)
        
        let item = ShoppingList.Item(name: "Spoon")
        let item2 = ShoppingList.Item(name: "Knife")
        let item3 = ShoppingList.Item(name: "Fork")
        
        let recipe = ShoppingList.Recipe(name: "Chips", ingredients: [ingredient, ingredient2])
        let recipe2 = ShoppingList.Recipe(name: "Burgers", ingredients: [ingredient3, ingredient4, ingredient5, ingredient6])
        let recipeListDummy = [recipe, recipe2]
        
        return shoppingListDummy
    }
}
