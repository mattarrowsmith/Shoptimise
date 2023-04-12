//
//  ManageListsView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 20/03/2023.
//

import SwiftUI

struct ManageListsView: View {
    @EnvironmentObject var lists: ShoppingLists
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Select a list to edit or click the plus to create a new list.").padding()
                
                Spacer()
                List(){
                    Section(){
                        ForEach(0..<$lists.shoppingLists.count, id: \.self) { index in
                            NavigationLink {
                                EditListView(selectedShoppingListIndex: index).environmentObject(lists)
                            } label: {
                                Text($lists.shoppingLists[index].name.wrappedValue)
                            }
                        }
                    }
//                        header: {
//                        HStack{
//                            Text("New List")
//                            Spacer()
//                            Image(systemName: "plus")
//                        }
//                    }
                    Button {
                        let recipe = Recipe(name: "recipe", ingredients: [Recipe.Ingredient(name: "ingredient", price: 10)], imageUrl: URL(string: "https://picsum.photos/300")!)
                        let recipe2 = Recipe(name: "recipe2", ingredients: [Recipe.Ingredient(name: "ingredient", price: 10)], imageUrl: URL(string: "https://picsum.photos/300")!)
                        let item = ShoppingList.Item(name: "Donkey", price: 100)
                        
                        let list = ShoppingList(name: "LIST ADDED", recipes: [recipe, recipe2], items: [item])
                        
                        lists.shoppingLists.append(list)
                        
                    } label: {
                        Text("ADD LIST")
                    }
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Your Lists")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "info.circle")
                    
                }
            }
        }
        
    }
}

struct ManageListsView_Previews: PreviewProvider {
    static var previews: some View {
        ManageListsView().environmentObject(ShoppingLists())
    }
}
