//
//  ShopViewModel.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 15/02/2023.
//

import Foundation


extension ShopView{ 
    @MainActor class ShopViewModel: ObservableObject {
        
        @Published var title: String
        @Published var shoppingLists: [ShoppingList]
        @Published var selectedShoppingList: ShoppingList
        
        init(shoppingList: ShoppingList) {
            self.title = "Shop"
            self.shoppingLists = [shoppingList]
            self.selectedShoppingList = ShopViewModel.createDummyList(name: "Englando")
        }
        
        init() {
            self.title = "Shop"
            self.shoppingLists = [ShopViewModel.createDummyList(name: "American"), ShopViewModel.createDummyListMexican(name: "Mexican")]
            self.selectedShoppingList = ShopViewModel.createDummyList(name: "Canadian")
        }
        
        static func createDummyList(name: String) -> ShoppingList {
            let ingredient = Recipe.Ingredient(name: "Potato", price: 1.5)
            let ingredient2 = Recipe.Ingredient(name: "Oil", price: 1)
            
            let ingredient3 = Recipe.Ingredient(name: "Lettuce", price: 0.80)
            let ingredient4 = Recipe.Ingredient(name: "Patty", price: 2.50)
            let ingredient5 = Recipe.Ingredient(name: "Bun", price: 1.10)
            let ingredient6 = Recipe.Ingredient(name: "Potato", price: 0.30)
            
            let item = ShoppingList.Item(name: "Spoon")
            let item2 = ShoppingList.Item(name: "Knife")
            let item3 = ShoppingList.Item(name: "Fork")
            
            let recipe = Recipe(name: "Chips", ingredients: [ingredient, ingredient2], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!)
            let recipe2 = Recipe(name: "Burgers", ingredients: [ingredient3, ingredient4, ingredient5, ingredient6], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!)
            let shoppingListDummy = ShoppingList(name: name, recipes: [recipe, recipe2], items: [item, item2, item3])
            
            return shoppingListDummy
        }
        
        static func createDummyListMexican(name: String) -> ShoppingList {
            let ingredient = Recipe.Ingredient(name: "Tortilla", price: 1.5)
            let ingredient2 = Recipe.Ingredient(name: "Oil", price: 1)
            let ingredient3 = Recipe.Ingredient(name: "Cheese", price: 1)
            let ingredient4 = Recipe.Ingredient(name: "Beef", price: 0.80)
            let ingredient5 = Recipe.Ingredient(name: "Lettuce", price: 2.50)
            let ingredient6 = Recipe.Ingredient(name: "Sour Cream", price: 1.10)
            let ingredient7 = Recipe.Ingredient(name: "Salsa", price: 0.30)
            let ingredient8 = Recipe.Ingredient(name: "Pepper", price: 0.30)
            let ingredient9 = Recipe.Ingredient(name: "Chicken", price: 0.30)
            
            let item = ShoppingList.Item(name: "Dishwasher Tablets")
            let item2 = ShoppingList.Item(name: "Kitchen Roll")
            let item3 = ShoppingList.Item(name: "Sombrero")
            
            let recipe = Recipe(name: "Tacos", ingredients: [ingredient, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6, ingredient7], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!)
            let recipe2 = Recipe(name: "Fajitas", ingredients: [ingredient, ingredient3, ingredient5, ingredient6, ingredient7, ingredient8, ingredient9], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!)
            let shoppingListDummy = ShoppingList(name: name, recipes: [recipe, recipe2], items: [item, item2, item3])
            
            return shoppingListDummy
        }
    }
}
