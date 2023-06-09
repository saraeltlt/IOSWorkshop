//
//  FavoritesViewController.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 26/05/2023.
//

import UIKit

class FavoritesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet weak var favTable: UITableView!
    var meal  : Meal?
    var meal2  : Meal?
    var credits : credit?
    var tags : ingredient?
    var instructions : instruction?
    var favoriteViewModel:FavoriteViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarController = self.tabBarController {
            if let tabItems = tabBarController.tabBar.items {
                if tabItems.count >= 2 {
                    let secondTabBarItem = tabItems[0]
                    secondTabBarItem.image = UIImage(systemName: "homekit")
   
                }
            }
        }
 /*      meal = Meal()
        credits = credit()
        tags = ingredient()
        instructions = instruction()
        meal?.name = "chicken"
        meal?.id = 90
        meal?.credits?[0].name = "aa"
        meal?.credits?[0].type = "a"
        meal?.tags?[0].display_name = "a"
        meal?.instructions?[0].display_text = "a"
        meal?.name = "a"
        meal?.num_servings = 2
        meal?.thumbnail_url = "a"
        meal?.tags?[0].type = "a"
        meal?.video_url = "a"
        var database = DatabaseManager.getInstance
      /*  database.saveMeals(data: meal!) { meal in
            print(self.meal?.name)
            if(meal == true){
                print("saved successfully")
            }
            }
 
  database.fetchMeals { meal in
            print(meal?[0].name)
        }
       */
        database.deleteMeals(id: 60) { delete in
            if delete == true {
                print("deleted successfully")
            }
        }*/
       
  
        
        let numberOfReceiptsImage = UIImageView()
        numberOfReceiptsImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        numberOfReceiptsImage.center = view.center
        numberOfReceiptsImage.contentMode = .scaleAspectFit
        numberOfReceiptsImage.image = UIImage(named: "Cooking")
        numberOfReceiptsImage.isHidden = true
        view.addSubview(numberOfReceiptsImage)
        favTable.register(UINib(nibName: "MealCell", bundle: nil),forCellReuseIdentifier: "MealCell")
        favTable.delegate = self
        favTable.dataSource = self
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.favoriteViewModel=FavoriteViewModel()
        self.favoriteViewModel?.mealsData.bind { status in
            guard let status = status else {return}
            if status {
                self.favTable.reloadData()
            }
        }
        self.favoriteViewModel?.removeFromFavorite.bind({ status in
            guard let status = status else {return}
            if status == .success {
                self.showAlert(title: "removed successfully", message: "Meal removed successfully from your favorite list you can't display it again")
                self.favTable.reloadData()
            } else if status == .error {
                self.showAlert(title: "Unexpected error", message: "can't remove Meal  from your favorite list")
            }
        })
        self.favoriteViewModel?.getFavoriteMeals()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteViewModel?.getMealsNumbers() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        cell.configure(meal: (self.favoriteViewModel?.getData(index: indexPath.row))!)
        cell.favBtn.tag=indexPath.row
        cell.favBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("Button tapped in cell at  row \(sender.tag)")
        self.favoriteViewModel?.removeFromFavorite(mealId: (self.favoriteViewModel?.getMealId(index: sender.tag))!, index: sender.tag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    
  /*  @IBAction func navigateFromFavoriteToDetails(_ sender: UIButton) {
        let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
        let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! detailsViewController
        detailsViewController.labellTest="Hello eslam"
        navigationController?.pushViewController(detailsViewController, animated: true)
    
    }  */


}
