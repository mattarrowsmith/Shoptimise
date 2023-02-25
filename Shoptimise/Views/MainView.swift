//
//  MainView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 01/02/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }

            BuildView()
                .tabItem {
                    Label("Build", systemImage: "list.bullet.clipboard")
                }
            
            AddRecipeView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
            
            ContentView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
