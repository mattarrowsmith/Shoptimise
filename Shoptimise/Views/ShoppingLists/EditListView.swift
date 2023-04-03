//
//  BuildView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 08/02/2023.
//

import SwiftUI

struct EditListView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = EditListViewModel()
    
    @State var selectedShoppingListIndex : Int
    @EnvironmentObject var lists: ShoppingLists
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Start picking recipes and suggestions will appear that share common ingredients. The colour of a recipe indicates how many ingredients it shares with your current recipes.").padding()
                
                Spacer()
                List{
                    Section(){
                        ForEach($lists.shoppingLists[selectedShoppingListIndex].recipes, id: \.name) { $recipe in
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
                        ForEach($lists.shoppingLists[selectedShoppingListIndex].items, id: \.name) { $item in
                            Text(item.name)
                        }
                    } header: {
                        HStack{
                            Text("Other Items")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    
                    Button {
                        let recipe = Recipe(name: "recipe", ingredients: [Recipe.Ingredient(name: "ingredient", price: 10)], imageUrl: URL(string: "https://picsum.photos/300")!)
                                            
                        lists.shoppingLists[selectedShoppingListIndex].recipes.append(recipe)
                        
                    } label: {
                        Text("ADD RECIPE TO LIST")
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle($lists.shoppingLists[selectedShoppingListIndex].name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "info.circle")
                
            }
        }
    }
}


struct BuildView_Previews: PreviewProvider {
    static var previews: some View {
        EditListView(selectedShoppingListIndex: 0).environmentObject(ShoppingLists())
    }
}
