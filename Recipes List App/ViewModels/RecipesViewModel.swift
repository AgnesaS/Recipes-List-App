//
//  RecipesViewModel.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import Foundation

class RecipesViewModel{
     var recipes = [RecipesModel]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
}
