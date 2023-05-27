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
    
    
    @IBOutlet weak var container: UIView!
    
   
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel:HomeViewModel?
    let categoryArray=MealCategorie.getCategoryData()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingIndicator.startAnimating()
        self.viewModel =  HomeViewModel()
        viewModel?.mealsData.bind({ [weak self] data in
            if let data = data{
                self?.container.isHidden = true
            }
            DispatchQueue.main.async {
                self?.mealsTable.reloadData()

            }
        })
        
        viewModel?.addToFavorite.bind({ status in
            if status == .success {
                print("added successfully from observer")
                self.showAlert(title: "Added successfully", message: "Meal added successfully to your favorite list you can display it any time")
            }else if status == .error {
                print("added before from observer")
                self.showAlert(title: "Unexpected Error", message: "Meal is already exist in your favorite list you can't insert it again")
            }
        })  

        self.mealsTable.register(UINib(nibName: "MealCell", bundle: nil), forCellReuseIdentifier: "MealCell")
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
        self.categoryArray.forEach({ item in
            item.isSelected = false
        })
        
        self.categoryArray[index].isSelected = true
        
        self.categoriesCollection.reloadData()
        
    }
    
    /* @IBAction func navigateToDetails(_ sender: UIButton) {
     let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
     let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! detailsViewController
     detailsViewController.labellTest="ESLAM"
     navigationController?.pushViewController(detailsViewController, animated: true)
 }*/

 
    
    
    
    
}





