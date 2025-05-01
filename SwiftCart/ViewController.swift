//
//  ViewController.swift
//  SwiftCart
//
//  Created by Onur Akviran on 29.04.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftCart"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }


}

