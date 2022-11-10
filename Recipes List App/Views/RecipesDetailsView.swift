//
//  RecipesDetailsView.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import SwiftUI

struct RecipesDetailsView: View {
    var recipes: RecipesModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        var viewModel =  RecipesViewModel()
        RecipesDetailsView(recipes: viewModel.recipes[0])
    }
}
