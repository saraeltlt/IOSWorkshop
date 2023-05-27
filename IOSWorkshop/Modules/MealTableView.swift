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
        cell.favBtn.tag=indexPath.row
        cell.favBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("Button tapped in cell at  row \(sender.tag)")
       self.viewModel?.addToFavorite(mealToInsert: (self.viewModel?.getAllObjectDataToInsert(index: sender.tag))!)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width * 0.55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* let detailsStoryBoard = UIStoryboard(name: "DetailsStoryBoard", bundle: nil)
        let detailsViewController = detailsStoryBoard.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        detailsViewController.detailsViewModel=viewModel.navigateToDetails(index:indexPath.row)
        navigationController?.pushViewController(detailsViewController, animated: true)*/
        print(indexPath.row)
        
    }
    
    
}
