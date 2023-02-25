//
//  ShopView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct ShopView: View {
    @StateObject private var viewModel = ShopViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack
            {
                List($viewModel.shoppingLists, id: \.name) { $shoppingList in
                    Section(shoppingList.name + ":") {
                        
                    }.font(Font.headline)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Section("Shared Items"){
                        ForEach(shoppingList.sharedIngredients, id: \.name) { item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text(String(item.price))
                            }
                        }
                    }

                    ForEach(shoppingList.recipes, id: \.name) { recipe in
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
                        ForEach(shoppingList.items, id: \.name) { item in
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





//struct ShopView: View {
//    var body: some View {
//        NavigationStack {
//            ZStack(alignment: .top) {
//                VStack
//                {
//                    List {
//                        Section("Mexican Food") {
//                            Text("Burger Pizza Curry...")
//                            Text("Fajitas, Pasta, Lasagna...")
//                            Text("Ice Cream, Cake, Pie...")
//                        }
//                        Section("Budget Week") {
//                            Text("Burger Pizza Curry...")
//                            Text("Fajitas, Pasta, Lasagna...")
//                            Text("Ice Cream, Cake, Pie...")
//                        }
//                    }.scrollContentBackground(.hidden)
//                        .edgesIgnoringSafeArea(.top)
//
//
//                    //Text("Bottom Bound")
//
//
//
//
//                }
//                .offset(x:0, y:60)
//                .padding([.bottom], 60)
//                .background(Color.background)
//
//
//                VStack{
//                    PageHeaderView(title: "Shop")
//                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 220)
//            }
//            .background(Color.red)
//
//            .navigationTitle("Navbar")
//            .navigationBarHidden(true);
//        }
//
//    }
//}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}


//struct ShopView: View {
//    var body: some View {
//        NavigationStack {
//            ZStack(alignment: .top) {
//                VStack
//                {
//                    Form {
//
//                        Section {
//                            Text("Burger Pizza Curry...")
//                            Text("Fajitas, Pasta, Lasagna...")
//                            Text("Ice Cream, Cake, Pie...")
//                        }
//                    }
//
//                    Text("HELLO")
//
//                }.offset(x:0, y:50)
//
//                VStack{
//                    PageHeaderView(title: "Shop")
//                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 220)
//            }
//
//        }
//        .navigationTitle("Navbar")
//        .navigationBarHidden(true);
//    }
//}
