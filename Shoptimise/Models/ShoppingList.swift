//
//  ShoppingList.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 16/02/2023.
//

import Foundation

struct ShoppingList: Equatable, Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var recipes: [Recipe]
    var items: [Item]
    
    init(name: String, recipes: [Recipe], items: [Item]){
        self.id = UUID()
        self.name = name
        self.recipes = recipes
        self.items = items
    }
    
    enum CodingKeys: String, CodingKey {
        case name, recipes, items
    }
    
    var sharedIngredients: [Recipe.Ingredient] {
        get {
            let firstRecipeIngredients = self.recipes.first?.ingredients ?? [] //list of ingredients
            let firstRecipeIngredientNames = Set(firstRecipeIngredients.map{ $0.name }) //set of strings ham, bread

            var ingredientNameLists = [[String]]()

            self.recipes.forEach { Recipe in
                let ingredientNames = Recipe.ingredients.map{ $0.name } //list of strings [lettuce, cheese, ham]
                ingredientNameLists.append(ingredientNames)
            }

            let commonElements = ingredientNameLists.reduce((firstRecipeIngredientNames)) { (result, list) in
                result.intersection(list)
            }

            var commonIngredients = [Recipe.Ingredient]()


            //Improve this once I know more swift!!
            self.recipes.forEach { ThisRecipe in //use for in instead of foreach
                ThisRecipe.ingredients.forEach { ThisIngredient in
                    if (commonElements.contains(ThisIngredient.name)) {

                        if let row = commonIngredients.firstIndex(where: {$0.name == ThisIngredient.name}) {
                            commonIngredients[row] = Recipe.Ingredient(name: ThisIngredient.name, price: commonIngredients[row].price + ThisIngredient.price)
                        }
                        else {
                            commonIngredients.append(ThisIngredient)
                        }
                    }
                }
            }
            return commonIngredients
        }
        set {

        }
    }
}

@MainActor class ShoppingLists: ObservableObject{
    @Published var shoppingLists: [ShoppingList]
    
    init(shoppingLists: [ShoppingList]){
        self.shoppingLists = shoppingLists
    }
    
    init() {
        self.shoppingLists = ShoppingListLocalRepository().loadShoppingLists()
    }
}

extension ShoppingList {
    struct Item: Equatable, Hashable, Codable {
        let name: String
        let price: Double
    }
}
