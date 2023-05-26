//
//  ViewController.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 25/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoriesCollection: UICollectionView!
    @IBOutlet weak var mealsTable: UITableView!
    var viewModel:HomeViewModel?
    var categoryArray:[HomeData]?
    var dummyData = MealModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel =  HomeViewModel()
        viewModel?.mealsData.bind({ [weak self] data in
            DispatchQueue.main.async {
                self?.mealsTable.reloadData()
            }
        })
        viewModel?.getMeals(mealCategory: "breakfast")

        self.mealsTable.register(UINib(nibName: "MealCell", bundle: nil), forCellReuseIdentifier: "MealCell")
        categoryArray=[HomeData]()
        categoryArray?.append(HomeData(title: "Popular", image: "Popular",isSelected: false))
        categoryArray?.append(HomeData(title: "Breakfast", image: "Breakfast",isSelected: false))
        categoryArray?.append(HomeData(title: "Lunch", image: "Lunch",isSelected: false))
        categoryArray?.append(HomeData(title: "Dinner", image: "Dinner",isSelected: false))
        categoryArray?.append(HomeData(title: "Dessert", image: "Dessert",isSelected: false))
        if let tabBarController = self.tabBarController {
            if let tabItems = tabBarController.tabBar.items {
                if tabItems.count >= 2 {
                    let secondTabBarItem = tabItems[1]
                    secondTabBarItem.image = UIImage(systemName: "heart")
     
                }
            }
        }
        
    }
    
    
    func changeSelectedCellBackground(index:Int){
        self.categoryArray?.forEach({ item in
            item.isSelected = false
        })
        
        self.categoryArray![index].isSelected = true
        
        self.categoriesCollection.reloadData()
        
    }
    
    /* @IBAction func navigateToDetails(_ sender: UIButton) {
     let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
     let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! detailsViewController
     detailsViewController.labellTest="ESLAM"
     navigationController?.pushViewController(detailsViewController, animated: true)
 }*/


}

class HomeData{
    var title:String
    var image:String
    var isSelected:Bool
    init(title:String,image:String,isSelected:Bool){
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}



