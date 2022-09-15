//
//  CardCell.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import UIKit

class CardCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImageV: UIImageView!
    @IBOutlet weak var foodNameL: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
