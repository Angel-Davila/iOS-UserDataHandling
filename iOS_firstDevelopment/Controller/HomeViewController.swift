//
//  HomeViewController.swift
//  iOS_firstDevelopment
//
//  Created by Edwin on 29/11/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItems = []
        self.navigationItem.hidesBackButton = true
    }

}
