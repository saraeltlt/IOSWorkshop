//
//  MealCategories.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 27/05/2023.
//

import Foundation

class MealCategorie {
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String, image: String, isSelected: Bool) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
    
    static func getCategoryData() -> [MealCategorie] {
        var categoryArray = [MealCategorie]()
        categoryArray.append(MealCategorie(title: "Popular", image: "Popular", isSelected: false))
        categoryArray.append(MealCategorie(title: "Breakfast", image: "Breakfast", isSelected: false))
        categoryArray.append(MealCategorie(title: "Lunch", image: "Lunch", isSelected: false))
        categoryArray.append(MealCategorie(title: "Dinner", image: "Dinner", isSelected: false))
        categoryArray.append(MealCategorie(title: "Dessert", image: "Dessert", isSelected: false))
        return categoryArray
    }
}

