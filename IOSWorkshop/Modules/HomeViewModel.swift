//
//  HomeViewModel.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
class HomeViewModel{
    var bindListToHomeViewController: (() -> Void)?
    
    
    var mealResponse: MealModel?
    func getMeals(mealCategory:String){
        NetworkManeger.getInstance().getMeals(with: mealCategory) {  [weak self] mealResponse in
            switch mealResponse {
               case .success(let data):
                   if let mealResponse = data {
                       self?.mealResponse = mealResponse
                       self?.bindListToHomeViewController?()
                   }
                   
               case .failure(let error):

                   print(error)
               }        }
    }
    
    
    
    
    
    
    
    
    
}
