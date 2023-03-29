//
//  MainView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var session = Session()

    var body: some View {
        TabView {
            ShopView(shoppingLists: $session.shoppingLists.wrappedValue) //this is wrong
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }

            ManageListsView()
                .tabItem {
                    Label("Lists", systemImage: "list.bullet.clipboard")
                }
            
            AddRecipeView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
            
            ContentView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }.environmentObject(session)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
