//
//  ExploreViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 06/08/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
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
        let nibPlant = UINib(nibName: "PlantTableViewCell", bundle: nil)
        let nibTip = UINib(nibName: "TipTableViewCell", bundle: nil)
        tableView.register(nibPlant, forCellReuseIdentifier: "plantCell")
        tableView.register(nibTip, forCellReuseIdentifier: "tipCell")
    }
}
extension ExploreViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "plantCell") as! PlantTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell") as! TipTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0{
            let vc = (storyboard?.instantiateViewController(withIdentifier: "2"))! as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = (storyboard?.instantiateViewController(identifier: "01"))! as ArticleViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
