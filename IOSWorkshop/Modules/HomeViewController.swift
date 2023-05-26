//
//  ViewController.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 25/05/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    /* @IBAction func navigateToDetails(_ sender: UIButton) {
     let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
     let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! detailsViewController
     detailsViewController.labellTest="ESLAM"
     navigationController?.pushViewController(detailsViewController, animated: true)
 }*/


}

