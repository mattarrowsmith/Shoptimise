//
//  PageHeaderView.swift
//  Shoptimise
//
//  Created by Arrowsmith, Matthew on 07/02/2023.
//

import SwiftUI

struct PageHeaderView: View {
    
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Ellipse()
                    .fill(Color.accentColor)
                    .frame(width: geometry.size.width * 1.7, height: geometry.size.height * 0.75)
                    .position(x: geometry.size.width / 2.35, y: geometry.size.height * 0.15)
                    .shadow(radius: 3)
                    .clipShape(Rectangle())
                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(self.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    .padding(.leading, 25)
                    .padding(.top, 15)
                    Spacer()
                }
            }
        }
    }
    
}

struct PageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PageHeaderView(title: "title")
    }
}
