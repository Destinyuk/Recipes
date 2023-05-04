//
//  FeaturesView.swift
//  Recipes
//
//  Created by Ash on 26/04/2023.
//

import SwiftUI

struct FeaturesView: View {
    @EnvironmentObject var model: RecipeModel
    @State var showingDetailView = false
    @State var tabSelectionIndex = 0
    

    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter( { $0.featured })
        
        VStack {
            
            Text("Featured Recipes")
                .bold()
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<featuredRecipes.count) { index in
                        
                            
                            Button(action: {
                                self.showingDetailView = true
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(featuredRecipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(featuredRecipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                            
                        

                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(spacing: 5) {
                
                Text("Prep Time")
                    .font(.headline)
                    .bold()
                Text(model.recipes[tabSelectionIndex].prepTime)
                
                Text("Highlights")
                    .font(.headline)
                    .bold()
                HighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)

            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $showingDetailView, content: {
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        })
    }
    
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
            .environmentObject(RecipeModel())
    }
}
