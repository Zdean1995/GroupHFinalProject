//
//  ToppinsTVC.swift
//  GroupHFinalProject
//
//  Created by Ertugrul on 2023-04-16.
//

import UIKit

class ToppinsTVC: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    } 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
