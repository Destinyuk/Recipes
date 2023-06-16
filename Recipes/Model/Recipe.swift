//
//  Recipe.swift
//  Recipes
//
//  Created by Ash on 19/04/2023.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    let name: String
    var category:String
    let featured: Bool
    let image, description, prepTime, cookTime: String
    let totalTime: String
    let servings: Int
    let ingredients: [Ingredients]
    let directions: [String]
    let highlights: [String]
}

class Ingredients: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
