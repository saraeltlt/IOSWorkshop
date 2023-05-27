//
//  MealCollectionCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 27/05/2023.
//

import UIKit

class MealCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bbView: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var bgViewFade: UIView!
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var srvingsLabel: UILabel!
    @IBOutlet weak var mealType: UILabel!
    @IBOutlet weak var chefName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bbView.layer.cornerRadius =  bbView.frame.width*0.04
        mealImage.layer.cornerRadius =  mealImage.frame.width*0.04
        bgViewFade.layer.cornerRadius =  bgViewFade.frame.width*0.04
        
    }
    
    
    func configure(meal : Meal){
        titleName.text = meal.name
        srvingsLabel.text = "Servings \(meal.num_servings ?? 2)"
        mealType.text = meal.credits?[0].type ?? "dessert"
        chefName.text = meal.credits?[0].name  ?? "unknown"
        mealImage.sd_setImage(with: URL(string: meal.thumbnail_url ?? ""), placeholderImage: UIImage(named: "placeholder"))
        
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
    }
    
}
