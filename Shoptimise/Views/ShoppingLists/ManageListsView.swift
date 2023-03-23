//
//  ManageListsView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 20/03/2023.
//

import SwiftUI

struct ManageListsView: View {
    @EnvironmentObject var session: Session
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is where you will build your shopping lists. Select a list to edit or click the plus to create a new list.").padding()
                
                Spacer()
                List(){
                    Section(){
                        NavigationLink {
                            EditListView(shoppingList: $session.shoppingLists.wrappedValue.first!)
                        } label: {
                            Text("American")
                        }
                        
                        NavigationLink {
                            EditListView(shoppingList: $session.shoppingLists.wrappedValue.last!)
                        } label: {
                            Text("Mexican")
                        }
                    } header: {
                        HStack{
                            Text("Add Recipes")
                            Spacer()
                            Image(systemName: "plus")
                        }
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
        ManageListsView()
    }
}
