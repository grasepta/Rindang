//
//  PlantDetailViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 10/12/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController {
    @IBOutlet weak var imagePlant: UIImageView!
    @IBOutlet weak var descPlant: UILabel!
    @IBOutlet weak var instPlant: UILabel!
    @IBOutlet weak var cahayaPlant: UILabel!
    @IBOutlet weak var airPlant: UILabel!
    @IBOutlet weak var masalahPlant: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tumbuhan.sharedInstance.selectedPlant.name
        imagePlant.image = tumbuhan.sharedInstance.selectedPlant.gambar
        descPlant.text = tumbuhan.sharedInstance.selectedPlant.deskripsi
        instPlant.text = tumbuhan.sharedInstance.selectedPlant.instruksi
        cahayaPlant.text = tumbuhan.sharedInstance.selectedPlant.cahaya
        airPlant.text = tumbuhan.sharedInstance.selectedPlant.air
        masalahPlant.text = tumbuhan.sharedInstance.selectedPlant.masalah
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        //Stock Plant
        var tempIntStock = 0
        for i in 0...tumbuhan.sharedInstance.plantStock.count-1 {
            if tumbuhan.sharedInstance.plantStock[i].name == tumbuhan.sharedInstance.selectedPlant.name{
                tempIntStock = i
            }
        }
        print(tempIntStock)
        
        //Garden Plant
        var tempIntGarden = 0
        if tumbuhan.sharedInstance.listKebun.count>0 {
            for i in 0...tumbuhan.sharedInstance.listKebun.count-1 {
                if tumbuhan.sharedInstance.listKebun[i].name == tumbuhan.sharedInstance.selectedPlant.name{
                    tempIntGarden = i
                }
            }
        }
        
        
        if  tumbuhan.sharedInstance.selectedPlant.status == false{
            tumbuhan.sharedInstance.selectedPlant.status = true
            tumbuhan.sharedInstance.listKebun.append(tumbuhan.sharedInstance.selectedPlant)
            tumbuhan.sharedInstance.plantStock[tempIntStock].status = true
            
        }else{
            tumbuhan.sharedInstance.selectedPlant.status = false
            tumbuhan.sharedInstance.plantStock[tempIntStock].status = false
            tumbuhan.sharedInstance.listKebun.remove(at: tempIntGarden)
            
        }
        
        
        
        
        
        
        
    }
}
