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
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Images
                Image(recipes.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom,5)
                    
                    ForEach(recipes.ingredients, id: \.self){ item in
                        Text("• " + item)
                            .padding(.bottom, 1)
                        
                    }
                }
                .padding(.horizontal)
                
                //MARK: Devider
                Divider()
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0...recipes.directions.count-1, id: \.self){ index in
                        Text(String(index+1)+". " + recipes.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
            }
            
          
        }
        .navigationBarTitle(recipes.name)
    }
}

struct RecipesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        var viewModel =  RecipesViewModel()
        RecipesDetailsView(recipes: viewModel.recipes[0])
    }
}
