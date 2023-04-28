//
//  FeaturesView.swift
//  Recipes
//
//  Created by Ash on 26/04/2023.
//

import SwiftUI

struct FeaturesView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack {
            Text("Featured Recipes")
                .bold()
                .font(.largeTitle)
            GeometryReader { geo in
                TabView {
                    
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                            
                        }

                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(spacing: 5) {
                
                Text("Prep Time")
                    .font(.headline)
                    .bold()
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                    .bold()
                Text("Specials notes")

            }
            .padding([.leading, .bottom])
        }
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
    }
}
