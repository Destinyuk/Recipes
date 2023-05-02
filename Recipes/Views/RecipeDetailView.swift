//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Ash on 20/04/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var servingSize = 2
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                
                //MARK: - Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
               Spacer()
                //MARK: -
                Picker("",selection: $servingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 220)
                //
                
                Text(recipe.name)
                        .bold()
                        .font(.largeTitle)
                
                
                //MARK: - Ingredients
                VStack (alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServings: servingSize) + " " + item.name.lowercased())
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
