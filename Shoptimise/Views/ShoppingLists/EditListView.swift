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
    init(listName: String){
        _viewModel = StateObject(wrappedValue: EditListViewModel(listName: listName))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Start picking recipes and suggestions will appear that share common ingredients. The colour of a recipe indicates how many ingredients it shares with your current recipes.").padding()
                
                Spacer()
                List(){
                    Section(){
                        Text("BBQ Beef")
                        Text("Burgers")
                    } header: {
                        HStack{
                            Text("Add Recipes")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    
                    Section(){
                        Text("Sponges")
                        Text("Washing Up Liquid")
                    } header: {
                        HStack{
                            Text("Other Items")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle($viewModel.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "info.circle")
                    
                }
            }
        }
    }
}

struct BuildView_Previews: PreviewProvider {
    static var previews: some View {
        EditListView(listName: "Preview List Name")
    }
}
