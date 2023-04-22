//
//  ContentView.swift
//  Recipes
//
//  Created by Ash on 19/04/2023.
//

import SwiftUI

struct RecipeListView: View {
   @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .center)
                            .clipped()
                            .cornerRadius(7)
                        
                        Text(r.name)
                    }
                })
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
