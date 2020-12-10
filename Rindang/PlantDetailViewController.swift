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
            let alert = UIAlertController(title: "Tambah", message: "Anda akan mendapatkan pemberitahuan untuk menyiram tanaman", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true){
                tumbuhan.sharedInstance.selectedPlant.status = true
                tumbuhan.sharedInstance.listKebun.append(tumbuhan.sharedInstance.selectedPlant)
                tumbuhan.sharedInstance.plantStock[tempIntStock].status = true
                //tumbuhan.sharedInstance.listStored.append(tumbuhan.sharedInstance.plantStock[tempIntStock].name)
                self.storePlant()
            }
        }else{
            let alert = UIAlertController(title: "Hapus", message: "Anda menonaktifkan pemberitahuan", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tidak", style: UIAlertAction.Style.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Ya", style: UIAlertAction.Style.default, handler: { action in
                tumbuhan.sharedInstance.selectedPlant.status = false
                tumbuhan.sharedInstance.plantStock[tempIntStock].status = false
                tumbuhan.sharedInstance.listKebun.remove(at: tempIntGarden)
               // tumbuhan.sharedInstance.listStored.remove(at: tempIntGarden)
                self.storePlant()
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func storePlant(){
        var tempArray:[String] = []
        for i in tumbuhan.sharedInstance.listKebun {
            tempArray.append(i.name)
        }
        UserDefaults.standard.setValue(tempArray, forKey: "storedPlant")
    }
}
