//
//  IngredientsCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 27/05/2023.
//

import UIKit

class IngredientsCell: UITableViewCell {

    @IBOutlet weak var ingrediantNameLabel: UILabel!
    
    
    @IBOutlet weak var ingrediantDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(ingrediantName: String, ingrediantDetail: String){
        ingrediantNameLabel.text = ingrediantName
        ingrediantDetailLabel.text = ingrediantDetail
        
    }
    
}
