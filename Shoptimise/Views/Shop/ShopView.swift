//
//  ShopView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct ShopView: View {
    @State private var selectedShoppingList : ShoppingList = ShopView.PreviewHelper().shoppingList
    @StateObject private var viewModel: ShopViewModel
    init(shoppingLists: [ShoppingList]){
        _viewModel = StateObject(wrappedValue: ShopViewModel(shoppingLists: shoppingLists))
    }
    
    var body: some View {
        NavigationStack {
            VStack
            {
                Form() {
                    Section {
                        Picker("Select List", selection: $viewModel.selectedShoppingList) {
                            ForEach($viewModel.shoppingLists, id: \.self) { $list in
                                Text(list.name)
                            }
                        }
                    }
                    
                    //Text($viewModel.title.wrappedValue)
                    
                    
                    Section("Shared Items"){
                        ForEach($viewModel.selectedShoppingList.sharedIngredients, id: \.self) { $item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text(String(item.price))
                            }
                        }
                    }

                    ForEach($viewModel.selectedShoppingList.recipes, id: \.name) { $recipe in
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
        ShopView(shoppingLists: [ShopView.PreviewHelper().shoppingList])
    }
}
