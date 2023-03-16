//
//  ShopView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct ShopView: View {
    @StateObject private var viewModel = ShopViewModel()
    @State private var selectedShoppingList : ShoppingList = ShopViewModel.createDummyList(name: "Create a list")
    @State private var selectedShoppingListIndex : Int = 0
    
    
    var body: some View {
        NavigationStack {
            VStack
            {
                
                Form() {
                    Section {
                        Picker("Select List", selection: $selectedShoppingList) {
                            ForEach($viewModel.shoppingLists, id: \.self) { $list in
                                Text(list.name)
                            }
                        }
                    }

                    Section("Shared Items"){
                        ForEach(selectedShoppingList.sharedIngredients, id: \.name) { item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text(String(item.price))
                            }
                        }
                    }

                    ForEach(selectedShoppingList.recipes, id: \.name) { recipe in
                        Section(recipe.name){
                            ForEach(recipe.ingredients, id: \.name) { ingredient in
                                HStack{
                                    Text(ingredient.name)
                                    Spacer()
                                    Text(String(ingredient.price))
                                }
                            }
                        }
                    }

                    Section("Other Items"){
                        ForEach(selectedShoppingList.items, id: \.name) { item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text(String(1.0))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Shop")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "info.circle")
                
                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}


//                    Section(selectedShoppingList.name) {
//
//                    }.font(Font.headline)
//                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
