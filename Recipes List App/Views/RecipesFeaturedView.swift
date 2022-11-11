//
//  RecipesFeaturedView.swift
//  Recipes List App
//
//  Created by Agnesa  on 11.11.22.
//

import SwiftUI

struct RecipesFeaturedView: View {
    
    @EnvironmentObject var viewModel: RecipesViewModel
    var body: some View {
        Text("Featured View")
    }
}

struct RecipesFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesFeaturedView()
    }
}
