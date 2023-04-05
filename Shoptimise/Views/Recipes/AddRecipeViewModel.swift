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
        self.recipeCells = RecipeLocalRepository().loadRecipes().map { RecipeCell(recipe: $0.self) }
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

