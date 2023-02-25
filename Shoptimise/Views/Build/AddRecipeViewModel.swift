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
}


extension Recipe{
    
}
