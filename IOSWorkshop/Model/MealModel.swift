//
//  MealModel.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
class MealModel : Decodable {
    var count: Int?
    var results : [Meal]?
    
}

class Meal : Decodable{
    
    var id: Int?
    var name: String?
    var  credits : [credit]? //chef and type
    var thumbnail_url: String?
    var video_url : String?
    var num_servings : Int?
    var instructions: [instruction]?
    var tags: [ingredient]?
    
    
}

class credit : Decodable{
    var name: String? //chef_name
    var type: String? //mealType
    
}
class instruction : Decodable{
    var display_text: String?
}
class ingredient : Decodable{
    var display_name: String?
    var type: String?
}
