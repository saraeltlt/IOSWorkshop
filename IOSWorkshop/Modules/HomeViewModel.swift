//
//  HomeViewModel.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import Foundation
class HomeViewModel{
    
    var mealsData:Observable<Bool>=Observable(false)
    var addToFavorite:Observable<AddFavoritueStatus>=Observable(.waiting)
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
   
    
    func addToFavorite(mealToInsert:Meal){
        DatabaseManager.getInstance.saveMeals(data: mealToInsert) { [weak self] status in
            if status {
                self?.addToFavorite.value = .success
            }else {
                self?.addToFavorite.value = .error
            }
        }
    }
    
    
    func getData(index:Int)->StructMealToView{
        return StructMealToView(data: self.mealResponse[index])
    }
   
    func getAllObjectDataToInsert(index:Int)->Meal{
        return self.mealResponse[index]
    }
    func getMealsNumbers()->Int{
        return mealResponse.count
    }
    func navigateToDetails(index:Int) -> DetailsViewModel{
        return DetailsViewModel(meal: mealResponse[index])
    }
    
    
    
    
    
}

enum AddFavoritueStatus {
    case waiting
    case success
    case error
}

