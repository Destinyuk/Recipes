//
//  DataService.swift
//  Recipes
//
//  Created by Ash on 19/04/2023.
//

import Foundation

class DataService {
    
   static func loadData() -> [Recipe] {
        let jsonString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard jsonString != nil else {
            return [Recipe]()
        }
        let url = URL(fileURLWithPath: jsonString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
                
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
