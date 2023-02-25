//
//  AddRecipeView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import SwiftUI
struct AddRecipeView: View {
    @State private var searchText = ""
    @State private var isExpanded: Bool = false;
    @State private var isExpanded2: Bool = false;

    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Spacer()
                    Button("Filter"){
                        
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    //.background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Spacer()
                    Button("Sort"){
                        
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    //.background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Spacer()
                }
                List(){
                    Section(){
                        DisclosureGroup("Fajitas", isExpanded: $isExpanded){
                            HStack() {
                                Spacer()
                                
                                VStack(alignment: .center){
                                    
                                    AsyncImage(url: URL(string: "https://picsum.photos/300"))
                                    Text("{Recipe Description}")
                                }
                                
                                Spacer()
                            }
                            
                            VStack(alignment: .leading){
                                Text("{Ingredient1}")
                                Text("{Ingredient2}")
                                Text("{Ingredient3}")
                                Text("{Ingredient4}")
                            }
                        }
                    }
                    
                }.searchable(text: $searchText)

            }.navigationTitle("Add Recipe")
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
