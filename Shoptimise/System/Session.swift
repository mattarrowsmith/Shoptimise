//
//  Session.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 22/03/2023.
//

import Foundation

class Session : ObservableObject
{
    @Published var shoppingLists: [ShoppingList]
    
    init() {
        self.shoppingLists = ShoppingListLocalRepository().loadShoppingLists();
    }
}

