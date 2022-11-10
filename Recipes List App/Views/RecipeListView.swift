//
//  ContentView.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import SwiftUI

struct ContentView: View {
    
    var model = RecipesViewModel()
    var body: some View {
        
        List(model.recipes){ r in
            HStack{
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                Text(r.name)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
