//
//  StructMealToView.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 27/05/2023.
//

import Foundation

struct StructMealToView{
    var name:String
    var chef:String
    var type:String
    var serving:String
    var image:String
    init(data:Meal){
        self.name=data.name ?? "unknown"
        self.chef=data.credits?[0].name ?? "unknown"
        self.type=data.credits?[0].type  ?? "cuisine"
        self.serving="servings:\(data.num_servings ?? 0)"
        self.image=data.thumbnail_url ?? ""
    }
}
