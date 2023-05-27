//
//  MealTableView.swift
//  IOSWorkshop
//
//  Created by Eslam gamal on 27/05/2023.
//


import UIKit

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getMealsNumbers() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        cell.configure(meal: (viewModel?.getData(index: indexPath.row))!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width * 0.55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
        let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        detailsViewController.detailsViewModel=viewModel.navigateToDetails(index:indexPath.row)
        navigationController?.pushViewController(detailsViewController, animated: true)*/
        
        
    }
    
    
}
