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
    
    static func getPortion(ingredient: Ingredients, recipeServing: Int, targetServings: Int) -> String {
        
        var portion = ""
        var wholePortions = 0
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        
        if ingredient.num != nil {
            denominator *= recipeServing
            
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            

            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
          
            portion += ingredient.unit == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        
        return portion 
    }
    
}
