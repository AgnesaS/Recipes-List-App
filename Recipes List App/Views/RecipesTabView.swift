//
//  RecipesTabView.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import SwiftUI

struct RecipesTabView: View {
    var body: some View {
        TabView{
            RecipesFeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            RecipesListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                    
                }
        }.environmentObject(RecipesViewModel())
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesTabView()
    }
}
