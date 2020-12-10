//
//  plantModel.swift
//  Rindang
//
//  Created by Aldino Grasepta on 29/08/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import Foundation
import UIKit


struct Plant {
    var name : String
    var sub : String
    var gambar : UIImage
}

class tumbuhan {
    static let sharedInstance = tumbuhan()
    
    var plantStock:[Plant] = [
        Plant(name: "Sansevieria trifasciata", sub: "Lidah mertua", gambar: #imageLiteral(resourceName: "snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535")),
        Plant(name: "Echinocactus grusonii", sub: "Kaktus barel", gambar: #imageLiteral(resourceName: "grow-echinocactus-indoors-1902973-05-2801eb30019f4a33bc70acf2c7ca02eb")),
        Plant(name: "Aloe Vera", sub: "Lidah Buaya", gambar: #imageLiteral(resourceName: "_DSC58741-476b7f7ef66d44ba8ce33cbc0d7b8dd4"))
    ]
    var plant:[Plant] = [
        Plant(name: "Sansevieria trifasciata", sub: "Lidah mertua", gambar: #imageLiteral(resourceName: "snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535")),
        Plant(name: "Echinocactus grusonii", sub: "Kaktus barel", gambar: #imageLiteral(resourceName: "grow-echinocactus-indoors-1902973-05-2801eb30019f4a33bc70acf2c7ca02eb")),
        Plant(name: "Aloe Vera", sub: "Lidah Buaya", gambar: #imageLiteral(resourceName: "_DSC58741-476b7f7ef66d44ba8ce33cbc0d7b8dd4"))
    ]
    var listTumbuhanTemp:[Plant] = []
    var listKebun:[Plant] = []
}
