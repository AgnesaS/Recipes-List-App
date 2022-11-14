//
//  RecipeHighlightsView.swift
//  Recipes List App
//
//  Created by Agnesa  on 14.11.22.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var allHighlights = ""
    
    init(highlights: [String]){
        
        //loop through the highlights and build the string
        
        for index in 0..<highlights.count{
            
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }else{
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["test","test1","test2"])
    }
}
