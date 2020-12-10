//
//  ArticleViewController.swift
//  Rindang
//
//  Created by Aldino Grasepta on 07/12/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
     
}
