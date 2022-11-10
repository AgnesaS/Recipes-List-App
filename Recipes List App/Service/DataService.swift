//
//  DataService.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import Foundation

class DataService: Decodable{
    
    func getLocalData() -> [RecipesModel]{
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //Check if pathString is not nil
        guard pathString != nil else{
            return [RecipesModel]()
        }
        
        do{
            let url = URL(fileURLWithPath: pathString!)
            let data = try Data(contentsOf: url)
            //Decode the data with JSON decoder
            let decoder = JSONDecoder()
            let recipesData = try decoder.decode([RecipesModel].self, from: data)
            //Add unique IDs
            for r in recipesData{
                r.id = UUID()
            }
            return recipesData
        }
        catch{
            print(error)
        }
        return [RecipesModel]()
    }
}
