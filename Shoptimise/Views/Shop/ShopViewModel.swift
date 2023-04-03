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
        
        init(shoppingLists: [ShoppingList]) {
            self.title = "Shop"
            self.shoppingLists = shoppingLists
        }
    }
}

