//
//  GardenViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 07/12/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class GardenViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()

    }
    
    func commonInit() {
        setupTableView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setupTableView(){
        let nibPlant = UINib(nibName: "ListPlantTableViewCell", bundle: nil)
        
        tableView.register(nibPlant, forCellReuseIdentifier: "plantListCell")
    }
}

extension GardenViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantListCell") as! ListPlantTableViewCell
        cell.imagePlant.layer.cornerRadius = cell.imagePlant.frame.size.height/4
        cell.imagePlant.image = tumbuhan.sharedInstance.listGambar[indexPath.row]
        cell.labelTittle.text = tumbuhan.sharedInstance.listTumbuhan[indexPath.row]
        cell.labelSub.text = tumbuhan.sharedInstance.listSub[indexPath.row]
        return cell
    }
}
