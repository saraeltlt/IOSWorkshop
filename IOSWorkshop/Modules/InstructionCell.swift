//
//  InstructionCell.swift
//  IOSWorkshop
//
//  Created by Sara Eltlt on 27/05/2023.
//

import UIKit

class InstructionCell: UITableViewCell {

    @IBOutlet weak var instructionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure( instruction : String) {
        instructionLabel.text = instruction
        
    }
    
}
