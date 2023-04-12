//
//  RecipeCell.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 12/04/2023.
//

import SwiftUI

struct RecipeCell: View {
    var body: some View {
        
        
        VStack(){
            HStack(alignment: .top){
                AsyncImage(url: URL(string: "https://picsum.photos/100"))
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading, spacing: 6){
                    Text("Carbonara")
                        .font(.headline)
                        .lineLimit(1)
                    Text("Discover how to make superb spaghetti carbonara. This cheesy pasta dish is an Italian favourite and with the right technique, you can make it perfect every time")
                        .font(.system(size: 10))
                        .lineLimit(4)
                    HStack(alignment: .bottom){
                        Text("Prep Time: 15 Mins").font(.system(size: 10))
                        Spacer()
                        Text("Difficulty: ★★★★").font(.system(size: 10))
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                }
            }
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.gray)
                    .frame(height: 10)
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.green)
                    .frame(width: 210, height: 10)
            }
        }
    }
}

struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell()
    }
}
