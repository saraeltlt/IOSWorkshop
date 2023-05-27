//
//  MealHeaderCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 27/05/2023.
//

import UIKit
import SDWebImage

class MealHeaderCell: UITableViewCell {

    @IBOutlet weak var favBackgroundView: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealKindLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        favBackgroundView.layer.cornerRadius =  favBackgroundView.frame.width*0.1
    }
     func configure(meal : Meal){
        mealNameLabel.text = "Toast"
        mealImage.sd_setImage(with: URL(string: meal.thumbnail_url ?? ""), placeholderImage: UIImage(named: "placeholder"))
        mealKindLabel.text = meal.credits?[0].type ?? ""
        servingsLabel.text = "Servings:\(meal.num_servings ?? 1)  "
        
    }
    @IBAction func playVideo(_ sender: UIButton) {
        
    }
    @IBAction func addFav(_ sender: UIButton) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
