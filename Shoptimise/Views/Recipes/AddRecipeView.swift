//
//  AddRecipeView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 25/02/2023.
//

import SwiftUI
struct AddRecipeView: View {
    @StateObject private var viewModel = AddRecipeViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                HStack{
                    Spacer()
                    Button(){
                        //action
                    } label: {
                        Text("Filter")
                        Image(systemName: "slider.horizontal.3")
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 5))

                    
                    Button(){
                        //action
                    } label: {
                        Text("Sort")
                        Image(systemName: "arrow.up.arrow.down")
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                List(){
                    Section(){
                        ForEach($viewModel.recipeCells) { $recipeCell in
                            RecipeCell()

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
