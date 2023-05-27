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
       meal = Meal()
        credits = credit()
        tags = ingredient()
        instructions = instruction()
        meal?.name = "chicken"
        meal?.show_id = 90
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
        }
       
  
        
        let noReceiptsImage = UIImageView()
        noReceiptsImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        noReceiptsImage.center = view.center
        noReceiptsImage.contentMode = .scaleAspectFit
        noReceiptsImage.image = UIImage(named: "Cooking")
        noReceiptsImage.isHidden = true
        view.addSubview(noReceiptsImage)
        favTable.register(UINib(nibName: "MealCell", bundle: nil),forCellReuseIdentifier: "MealCell")
        favTable.delegate = self
        favTable.dataSource = self
        
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTable.dequeueReusableCell(withIdentifier: "MealCell") as! MealCell

        return cell
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
