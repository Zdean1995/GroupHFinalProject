//
//  PrevOrderCell.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-16.
//

import UIKit

class PrevOrderCell: UITableViewCell {

  
    @IBOutlet weak var toppinsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
