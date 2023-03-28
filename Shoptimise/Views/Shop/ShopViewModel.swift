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
        
        init(shoppingLists: [ShoppingList]) {
            self.title = "Shop"
            self.shoppingLists = shoppingLists
            self.selectedShoppingList = shoppingLists.first ?? ShopView.PreviewHelper().shoppingList
        }
    }
}


extension ShopView {
    struct PreviewHelper {
        var shoppingList: ShoppingList
    //TODO: A better way to handle the default no list state
        init(){
            let ingredient = Recipe.Ingredient(name: "{ingredient}", price: 1)
            let item = ShoppingList.Item(name: "{item}", price: 1)
            
            let recipe = Recipe(name: "{recipe}", ingredients: [ingredient], imageUrl: URL(string: "https://picsum.photos/300")!)
            self.shoppingList = ShoppingList(name: "No list found", recipes: [recipe], items: [item])
        }
    }
}
