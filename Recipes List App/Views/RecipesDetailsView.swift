//
//  RecipesDetailsView.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import SwiftUI

struct RecipesDetailsView: View {
    
    @EnvironmentObject var viewModel: RecipesViewModel
    var recipes: RecipesModel
    @State var selectedIndex = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
               
                Image(recipes.image)
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6), radius: 10, x: -5, y: 5)
                Text(recipes.name)
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                VStack(alignment: .leading){
    
                Text("Choose your serving size")
                    Picker("Tap me", selection: $selectedIndex){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                       
                        }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom,5)
                    ForEach(recipes.ingredients){ item in
                        Text("• " + RecipesViewModel.getPortion(ingredient: item, recipeServing: recipes.servings, targetServing: selectedIndex) + " " + item.name)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                Divider()
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

    }
}
struct RecipesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        var viewModel =  RecipesViewModel()
        RecipesDetailsView(recipes: viewModel.recipes[0])
    }
}
