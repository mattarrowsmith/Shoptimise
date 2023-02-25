//
//  BuildView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 08/02/2023.
//

import SwiftUI

struct BuildView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
//                Text("This is where you will build your shopping lists. Start picking recipes and suggestions will appear that share common ingredients. The colour of a recipe indicates how many ingredients it shares with your current recipes.").padding()
                
                Spacer()
                List(){
                    Section(){
                        Text("Recipe1")
                        Text("Recipe2")
                    } header: {
                        HStack{
                            Text("Add Recipes")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    Section("Other Items"){
                        Text("Dishwasher Tablets")
                        Text("Cloths")
                    }
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Build")
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
        BuildView()
    }
}
