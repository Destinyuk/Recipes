//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Ash on 20/04/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                
                //MARK: - Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Spacer()
                
                //MARK: - Ingredients
                VStack (alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("•" + item)
                    }
                }
                .padding(.horizontal)
                Divider()
                Spacer()
                
                //MARK: - Directions
                VStack(alignment: .leading) {
                    Text("Directions:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
            }
            .padding([.leading, .trailing], 5)
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
