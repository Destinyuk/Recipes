//
//  RecipeTabView.swift
//  Recipes
//
//  Created by Ash on 22/04/2023.
//

import SwiftUI

struct RecipeTabView: View {
    @State var selectedTab = Constants.featuredTab
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            FeaturesView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid4.2x2")
                        Text("Category")
                    }
                }
                .tag(Constants.categoriesTab)
            
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.star")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
