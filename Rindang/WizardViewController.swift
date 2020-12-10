//
//  ViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 18/07/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class WizardViewController: UIViewController {
    
    @IBOutlet weak var memindaiButton: UIView!
    @IBOutlet weak var cariButton: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        tumbuhan.sharedInstance.plant = tumbuhan.sharedInstance.plantStock
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    func commonInit()  {
        memindaiButton.layer.cornerRadius = memindaiButton.frame.size.height/2
        memindaiButton.layer.borderWidth = 2
        memindaiButton.layer.borderColor = #colorLiteral(red: 0.262745098, green: 0.5411764706, blue: 0.368627451, alpha: 1)
        cariButton.layer.cornerRadius = cariButton.frame.size.height/2
        cariButton.layer.borderWidth = 2
        cariButton.layer.borderColor = #colorLiteral(red: 0.262745098, green: 0.5411764706, blue: 0.368627451, alpha: 1)
        fetchPlant()
    }
    func fetchPlant() {
        var storedPlant: [String] = UserDefaults.standard.stringArray(forKey: "storedPlant")!
        for i in storedPlant {
            for j in 0...tumbuhan.sharedInstance.plantStock.count-1 {
                if i == tumbuhan.sharedInstance.plantStock[j].name {
                    tumbuhan.sharedInstance.plantStock[j].status = true
                    tumbuhan.sharedInstance.listKebun.append(tumbuhan.sharedInstance.plantStock[j])
                }
            }
        }
    }
}

