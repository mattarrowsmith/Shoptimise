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
        
        init(shoppingList: ShoppingList) {
            self.title = "Shop"
            self.shoppingLists = [shoppingList]
        }
        
        init() {
            self.title = "Shop"
            self.shoppingLists = [ShopViewModel.createDummyList()]
        }
        
        static func createDummyList() -> ShoppingList {
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
            let shoppingListDummy = ShoppingList(name: "Fast Food Shopping List", recipes: [recipe, recipe2], items: [item, item2, item3])
            
            return shoppingListDummy
        }
    }
}
