//
//  FavoritesViewController.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 26/05/2023.
//

import UIKit

class FavoritesViewController: UIViewController {

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

    }
    
  /*  @IBAction func navigateFromFavoriteToDetails(_ sender: UIButton) {
        let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
        let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! detailsViewController
        detailsViewController.labellTest="Hello eslam"
        navigationController?.pushViewController(detailsViewController, animated: true)
    
    }  */


}
