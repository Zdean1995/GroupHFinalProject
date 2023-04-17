//
//  ToppinsTVC.swift
//  GroupHFinalProject
//
//  Created by Ertugrul on 2023-04-16.
//

import UIKit

//depricated.  Was used when the project had a larger scope but we had trouble having multiple tables on a single page which is what we were going to use adding things like drinks and sides with.
class ToppinsTVC: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    } 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
