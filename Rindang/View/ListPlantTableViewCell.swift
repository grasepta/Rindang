//
//  ListPlantTableViewCell.swift
//  Rindang
//
//  Created by Aldino Grasepta on 04/12/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class ListPlantTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePlant: UIImageView!
    @IBOutlet weak var labelTittle: UILabel!
    @IBOutlet weak var labelSub: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
