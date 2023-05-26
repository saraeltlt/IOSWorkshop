//
//  ViewController.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 25/05/2023.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var categoriesCollection: UICollectionView!
    
    
    @IBOutlet weak var mealsTable: UITableView!
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categories", for: indexPath) as! CategoriesViewCell
        cell.categoryType.text=self.categoryArray![indexPath.row].title
        cell.categoryImage.image=UIImage(named: categoryArray![indexPath.row].image)
        cell.container.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        if self.categoryArray![indexPath.row].isSelected{
            cell.container.backgroundColor=UIColor(named: "Orange")
        } else {
            cell.container.backgroundColor = .clear
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.167), height: (collectionView.bounds.height*0.9))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        self.changeSelectedCellBackground(index: index)
        print(index)
    }
    
    
    var categoryArray:[HomeData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel =  HomeViewModel()
/*    viewModel.bindListToHomeViewController = { result in
            
        }
 */
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
                    secondTabBarItem.image = UIImage(systemName: "star.fill")
                    secondTabBarItem.title = "Favorite"
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

//MARK: -  table view

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return view.frame.width * 0.6
        return 180
    }
    
    
}
