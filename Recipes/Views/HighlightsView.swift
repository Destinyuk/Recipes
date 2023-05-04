//
//  HighlightsView.swift
//  Recipes
//
//  Created by Ash on 03/05/2023.
//

import SwiftUI

struct HighlightsView: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct HighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsView(highlights: ["Test1", "Test2", "Test3"])
    }
}
