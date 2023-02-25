//
//  ShoppingList.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 16/02/2023.
//

import Foundation

struct ShoppingList: Equatable {
    let name: String
    let recipes: [Recipe]
    let items: [Item]
    var sharedIngredients: [Ingredient] {
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
        
        var commonIngredients = [ShoppingList.Ingredient]()
        
        
        //Improve this once I know more swift!!
        self.recipes.forEach { Recipe in
            Recipe.ingredients.forEach { Ingredient in
                if (commonElements.contains(Ingredient.name)) {
                    
                    if let row = commonIngredients.firstIndex(where: {$0.name == Ingredient.name}) {
                        commonIngredients[row] = ShoppingList.Ingredient(name: Ingredient.name, price: commonIngredients[row].price + Ingredient.price)
                    }
                    else {
                        commonIngredients.append(Ingredient)
                    }
                }
            }
        }
        return commonIngredients
    }
}

extension ShoppingList {
    struct Item: Equatable {
        let name: String
    }
}

extension ShoppingList {
    struct Ingredient: Equatable {
        let name: String
        let price: Double
    }
}


