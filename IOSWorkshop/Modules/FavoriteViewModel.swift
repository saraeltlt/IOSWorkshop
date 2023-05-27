//
//  FavoriteViewModel.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 27/05/2023.
//

import Foundation

class FavoriteViewModel{
    var mealsData:Observable<Bool>=Observable(false)
    var removeFromFavorite:Observable<AddFavoritueStatus>=Observable(.waiting)
    var mealResponse = [Meal]()
    
    func getFavoriteMeals(){
        DatabaseManager.getInstance.fetchMeals { [weak self] MealsResponse in
            if let data = MealsResponse {
                self?.mealResponse=data
                self?.mealsData.value=true
            }
        }
    }
    func removeFromFavorite(mealId:Int,index:Int){
        DatabaseManager.getInstance.deleteMeals(id: mealId) { status in
            if status {
                self.mealResponse.remove(at: index)
                self.removeFromFavorite.value = .success
            }
        }
    }
    func getMealsNumbers()->Int{
        return mealResponse.count
    }
    func getData(index:Int)->StructMealToView{
        return StructMealToView(data: self.mealResponse[index])
    }
    func getMealId(index:Int)->Int{
        return self.mealResponse[index].id!
    }
}
