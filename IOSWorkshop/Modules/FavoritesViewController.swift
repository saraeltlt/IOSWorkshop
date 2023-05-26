//
//  FavoritesViewController.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 26/05/2023.
//

import UIKit

class FavoritesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet weak var favTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarController = self.tabBarController {
            if let tabItems = tabBarController.tabBar.items {
                if tabItems.count >= 2 {
                    let secondTabBarItem = tabItems[0]
                    secondTabBarItem.image = UIImage(systemName: "homekit")
                    secondTabBarItem.title = "Home"
                }
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
        cell.imageBtnView.backgroundColor = UIColor(named: "Orange")
        cell.bgImage.image = UIImage(named: "foodImage")
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
