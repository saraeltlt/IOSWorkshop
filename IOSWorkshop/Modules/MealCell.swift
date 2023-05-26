//
//  MealCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 26/05/2023.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var imageBtnView: UIView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealChefLabel: UILabel!
    @IBOutlet weak var mealTypeLabel: UILabel!
    @IBOutlet weak var mealServingLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addFavBtn(_ sender: UIButton) {
    }
}
