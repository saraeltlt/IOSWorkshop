//
//  DatabaseManegerProtocol.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
protocol DatabaseManegerProtocol{
    
    func fetchMeals(completion : @escaping ([Meal]?)-> Void)
    func saveMeals(data:Meal,completion : @escaping (Bool)-> Void)
    func deleteMeals(id : Int , completion : @escaping (Bool)-> Void)
    func isFavorite(id : Int)->Bool
}
