//
//  BuildView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 08/02/2023.
//

import SwiftUI

struct EditListView: View {
    @State private var searchText = ""
    //@StateObject private var viewModel: EditListViewModel
    @ObservedObject var shoppingList: ShoppingList
    
//    init(shoppingList: ShoppingList){
//        _viewModel = StateObject(wrappedValue: EditListViewModel(shoppingList: shoppingList))
//    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Start picking recipes and suggestions will appear that share common ingredients. The colour of a recipe indicates how many ingredients it shares with your current recipes.").padding()
                
                Spacer()
                List{
                    Section(){
                        ForEach($shoppingList.recipes, id: \.name) { $recipe in
                            Text(recipe.name)
                        }
                    } header: {
                        HStack{
                            Text("Recipes")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    
                    Section(){
                        ForEach($shoppingList.items, id: \.name) { $item in
                            Text(item.name)
                        }
                    } header: {
                        HStack{
                            Text("Other Items")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    
                    Button("ADD RECIPE"){
                        self.shoppingList.objectWillChange.send()
                        $shoppingList.recipes.wrappedValue.append(EditListView.dummyRecipe())
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle(shoppingList.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "info.circle")
                
            }
        }
    }
    
    static func dummyRecipe() -> Recipe{
        let ingredient = Recipe.Ingredient(name: "Potato", price: 1.5)
        let ingredient2 = Recipe.Ingredient(name: "Oil", price: 1)
        return Recipe(name: "Chips", ingredients: [ingredient, ingredient2], imageUrl: URL(string: "https://picsum.photos/300") ?? URL(string: "https://picsum.photos/300")!)
    }
}

struct BuildView_Previews: PreviewProvider {
    static var previews: some View {
        EditListView(shoppingList: EditListView.PreviewHelper().shoppingList)
    }
}
