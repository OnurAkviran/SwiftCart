//
//  ProductDetailViewController.swift
//  SwiftCart
//
//  Created by Onur Akviran on 2.05.2025.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.displayImage(baseImageUrl: baseImageUrl, filename: "saat.png")
    }
}
