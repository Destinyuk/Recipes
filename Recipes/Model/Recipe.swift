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
    let featured: Bool
    let image, description, prepTime, cookTime: String
    let totalTime: String
    let servings: Int
    let ingredients, directions: [String]
}
