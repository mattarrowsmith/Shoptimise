//
//  ShopView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var lists: ShoppingLists
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack
            {
                Form() {
                    Section {
                        Picker("Select List", selection: $selectedIndex) {
                            ForEach(0..<$lists.shoppingLists.count, id: \.self) { index in
                                Text($lists.shoppingLists.wrappedValue[index].name)
                            }
                        }
                    }
                    
                    
                    Section("Shared Items"){
                        ForEach($lists.shoppingLists[$selectedIndex.wrappedValue].sharedIngredients, id: \.self) { $item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text(String(item.price))
                            }
                        }
                    }
                    
                    ForEach($lists.shoppingLists[$selectedIndex.wrappedValue].recipes, id: \.name) { $recipe in
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
                        ForEach($lists.shoppingLists[$selectedIndex.wrappedValue].items, id: \.name) { $item in
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
        ShopView().environmentObject(ShoppingLists())
    }
}
