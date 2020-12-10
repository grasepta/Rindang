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
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
        return tumbuhan.sharedInstance.listKebun.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantListCell") as! ListPlantTableViewCell
        cell.imagePlant.layer.cornerRadius = cell.imagePlant.frame.size.height/4
        cell.imagePlant.image = tumbuhan.sharedInstance.listKebun[indexPath.row].gambar
        cell.labelTittle.text = tumbuhan.sharedInstance.listKebun[indexPath.row].name
        cell.labelSub.text = tumbuhan.sharedInstance.listKebun[indexPath.row].sub
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tumbuhan.sharedInstance.selectedPlant = tumbuhan.sharedInstance.listKebun[indexPath.row]
       
        let vc = (storyboard?.instantiateViewController(withIdentifier: "1"))! as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
