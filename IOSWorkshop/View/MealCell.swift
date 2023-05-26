//
//  MealCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import UIKit
import SDWebImage

class MealCell: UITableViewCell {

    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var imageBtnView: UIView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealChefLabel: UILabel!
    @IBOutlet weak var mealTypeLabel: UILabel!
    @IBOutlet weak var mealServingLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var fadeView2: UIView!
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet weak var backgroudView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroudView.layer.cornerRadius =  backgroudView.frame.width*0.04
        bgImage.layer.cornerRadius =  bgImage.frame.width*0.04
        fadeView.layer.cornerRadius =  fadeView.frame.width*0.04
        fadeView2.layer.cornerRadius =  fadeView2.frame.width*0.04
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func addFavBtn(_ sender: UIButton) {
        print ("tapped")
    }
    func configure(meal : StructMealToView){
        mealNameLabel.text = meal.name
        mealChefLabel.text = meal.chef
        mealTypeLabel.text = meal.type
        mealServingLabel.text = meal.serving
        bgImage.sd_setImage(with: URL(string: meal.image), placeholderImage: UIImage(named: "placeholder"))
        
    }
}
