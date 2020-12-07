//
//  PlantTableViewCell.swift
//  Rindang
//
//  Created by Aldino Grasepta on 29/08/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
    @IBOutlet weak var imagePlant: UIImageView!
    @IBOutlet weak var viewTittle: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePlant.layer.cornerRadius = imagePlant.frame.size.height/12
        viewTittle.layer.cornerRadius = viewTittle.frame.size.height/10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
