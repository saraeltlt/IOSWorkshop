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
        var category = mealCategory
        if category == "popular" {
            category = "drinks"
        }
        NetworkManeger.getInstance().getMeals(with: category) {  [weak self] mealResponse in
            switch mealResponse {
            case .success(let data):
                if let mealResponse = data {
                    self?.mealResponse = mealResponse.results ?? []
                    //    self?.mealsData.value=mealResponse.results
                    self?.mealsData.value=true
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
    func navigateToDetails(index:Int) -> DetailsViewModel{
        return DetailsViewModel(meal: mealResponse[index])
    }
    
    
    
    
    
}
