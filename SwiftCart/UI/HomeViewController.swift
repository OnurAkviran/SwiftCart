//
//  ViewController.swift
//  SwiftCart
//
//  Created by Onur Akviran on 29.04.2025.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftCart"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font:UIFont(name: "Yesteryear-Regular", size: 32)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }


}

