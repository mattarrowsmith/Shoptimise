//
//  ShoptimiseApp.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 18/01/2023.
//

import SwiftUI

@main
struct ShoptimiseApp: App {

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

extension Color {
    static let background = Color("BackgroundColor")
    static let accent = Color("AccentColor")
}
