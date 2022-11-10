//
//  RecipesModel.swift
//  Recipes List App
//
//  Created by Agnesa  on 10.11.22.
//

import Foundation

class RecipesModel: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
}
