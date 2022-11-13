//
//  RecipesViewModel.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import Foundation

class RecipesViewModel: ObservableObject{
    var recipes = [RecipesModel]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredients, recipeServing:Int, targetServing:Int) -> String{
        return String(targetServing)
        
    }
}
