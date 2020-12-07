//
//  SearchViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 18/11/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

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

extension SearchViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tumbuhan.sharedInstance.listTumbuhan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantListCell") as! ListPlantTableViewCell
        cell.imagePlant.layer.cornerRadius = cell.imagePlant.frame.size.height/4
        cell.imagePlant.image = tumbuhan.sharedInstance.listGambar[indexPath.row]
        cell.labelTittle.text = tumbuhan.sharedInstance.listTumbuhan[indexPath.row]
        cell.labelSub.text = tumbuhan.sharedInstance.listSub[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = (storyboard?.instantiateViewController(withIdentifier: "1"))! as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1{
            let vc = (storyboard?.instantiateViewController(withIdentifier: "2"))! as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2{
            let vc = (storyboard?.instantiateViewController(withIdentifier: "3"))! as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}