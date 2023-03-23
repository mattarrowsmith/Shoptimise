//
//  BuildView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 08/02/2023.
//

import SwiftUI

struct EditListView: View {
    @State private var searchText = ""
    @StateObject private var viewModel: EditListViewModel
    init(shoppingList: ShoppingList){
        _viewModel = StateObject(wrappedValue: EditListViewModel(shoppingList: shoppingList))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Start picking recipes and suggestions will appear that share common ingredients. The colour of a recipe indicates how many ingredients it shares with your current recipes.").padding()
                
                Spacer()
                List{
                    Section(){
                        ForEach($viewModel.shoppingList.wrappedValue.recipes, id: \.name) { recipe in
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
                        ForEach($viewModel.shoppingList.wrappedValue.items, id: \.name) { item in
                            Text(item.name)
                        }
                    } header: {
                        HStack{
                            Text("Other Items")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle($viewModel.shoppingList.wrappedValue.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "info.circle")
                
            }
        }
    }
}


struct BuildView_Previews: PreviewProvider {
    static var previews: some View {
        EditListView(shoppingList: EditListView.PreviewHelper().shoppingList)
    }
}
