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
            List(viewModel.recipes){ r in
                
                NavigationLink(destination:{ RecipesDetailsView(recipes: r)}, label: {
                    HStack(spacing: 20.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                })
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
