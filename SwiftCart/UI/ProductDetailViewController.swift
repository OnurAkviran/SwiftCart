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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    
    var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempProduct = product {
            imageView.displayImage(baseImageUrl: baseImageUrl, filename: product!.resim)
            nameLabel.text = tempProduct.ad
            brandLabel.text = tempProduct.marka
            priceLabel.text = "\(tempProduct.fiyat)₺"
        }
    }
}
