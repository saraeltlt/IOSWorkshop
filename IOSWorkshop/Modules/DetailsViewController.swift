//
//  DetailsViewController.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var meal : Meal!

    @IBOutlet weak var detailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    
        
    }
    
    
    private func setupTableView(){
        detailsTableView.delegate=self
        detailsTableView.dataSource=self
        
        /*detailsTableView.estimatedRowHeight=view.frame.width*0.15
        detailsTableView.rowHeight = UITableView.automaticDimension*/
        
        self.detailsTableView.register(UINib(nibName: "MealHeaderCell", bundle: nil), forCellReuseIdentifier: "MealHeaderCell")
        
        self.detailsTableView.register(UINib(nibName: "InstructionCell", bundle: nil), forCellReuseIdentifier: "InstructionCell")
        
        self.detailsTableView.register(UINib(nibName: "IngredientsCell", bundle: nil), forCellReuseIdentifier: "IngredientsCell")
        
        self.detailsTableView.register(UINib(nibName: "SimilarTableCell", bundle: nil), forCellReuseIdentifier: "SimilarTableCell")
       
    }

}

extension DetailsViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealHeaderCell", for: indexPath) as! MealHeaderCell
  
            cell.configure(meal: meal)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath) as! IngredientsCell
            cell.configure(ingrediantName: meal.tags![0].display_name!, ingrediantDetail:  meal.tags![0].type!)
            return cell
        case 2:
            detailsTableView.estimatedRowHeight=view.frame.width*0.15
            detailsTableView.rowHeight = UITableView.automaticDimension
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! InstructionCell
            
            cell.configure(instruction: meal.instructions![0].display_text!)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarTableCell", for: indexPath) as! SimilarTableCell
            return cell
        }
     
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Ingredients"
        case 2:
            return "Instructions"
        case 3:
            return "Similar Recipes"
        default:
            return ""
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.frame.height * 0.32
        case 1:
            return view.frame.height * 0.09
        case 2:
            return view.frame.height * 0.07
        default:
            return 250
        }
    }
    
    
    
    
    
}
/*  let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
 let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
 /*detailsViewController.detailsViewModel=viewModel.navigateToDetails(index:indexPath.row)*/
 detailsViewController.meal = viewModel?.mealResponse[0]
 navigationController?.pushViewController(detailsViewController, animated: true)
 */
