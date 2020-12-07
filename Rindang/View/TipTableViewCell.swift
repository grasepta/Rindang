//
//  TipTableViewCell.swift
//  Rindang
//
//  Created by Aldino Grasepta on 29/08/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class TipTableViewCell: UITableViewCell {
    @IBOutlet weak var viewWrap: UIView!
    @IBOutlet weak var imageTips: UIImageView!
    
    override func awakeFromNib() {
       // viewWrap.layer.cornerRadius = viewWrap.frame.size.height/10
        contentView.layer.cornerRadius = viewWrap.frame.size.height/10
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

