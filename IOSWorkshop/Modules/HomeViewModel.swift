//
//  HomeViewModel.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
class HomeViewModel{
        
    var mealsData:Observable<Bool>=Observable(false)
    var mealResponse = [Meal]()
    func getMeals(mealCategory:String){
        NetworkManeger.getInstance().getMeals(with: mealCategory) {  [weak self] mealResponse in
            switch mealResponse {
               case .success(let data):
                   if let mealResponse = data {
                       self?.mealResponse = mealResponse.results ?? []
                   //    self?.mealsData.value=mealResponse.results
                       self?.mealsData.value=true
                       print(self?.mealResponse.count)
                   print("here in view model")
                   }
                   
               case .failure(let error):

                   print(error)
               }        }
    }
    func getData(index:Int)->StructMealToView{
        return StructMealToView(data: self.mealResponse[index])
    }
    func getMealsNumbers()->Int{
        return mealResponse.count
    }
    
 
    
    
    
}
