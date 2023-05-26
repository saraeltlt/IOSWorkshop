//
//  NetworkManegerProtocol.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation

protocol NetworkManegerProtocol{
    
    func getMeals(with tag: String, completion: @escaping (Result<MealModel?, Error>) -> Void)
    func getSimilarRecipes(with mealID: Int , completion: @escaping (Result<Data?, Error>) -> Void) 
}
