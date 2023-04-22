//
//  RecipeModel.swift
//  Recipes
//
//  Created by Ash on 19/04/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {

        self.recipes = DataService.loadData()
    }
    
}
