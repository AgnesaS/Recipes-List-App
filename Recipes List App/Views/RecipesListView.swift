//
//  RecipesListView.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject var viewModel: RecipesViewModel
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(viewModel.recipes){ r in
                            
                            NavigationLink(destination:{ RecipesDetailsView(recipes: r)}, label: {
                                HStack(spacing: 20.0){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading){
                                    Text(r.name)
                                        .foregroundColor(.black)
                                        .bold()
                                        RecipeHighlightsView(highlights: r.highlights)
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                            })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesViewModel())
    }
}
