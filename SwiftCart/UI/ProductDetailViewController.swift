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
    @IBOutlet weak var amountInCartLabel: UILabel!
    var productDetailViewViewModel = ProductDetailViewViewModel()
    
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    
    var product:Product?
    var productInCart: ProductInCart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempProduct = product {
            imageView.displayImage(baseImageUrl: baseImageUrl, filename: product!.resim)
            nameLabel.text = tempProduct.ad
            brandLabel.text = tempProduct.marka
            priceLabel.text = "\(tempProduct.fiyat)₺"
        }
        //if let tempProductInCart = productInCart {
        //    amountInCartLabel.text = "\(tempProductInCart.siparisAdeti!)"
        //} else {
        //    print("debug statement - nil object")
        //}
    }
    @IBAction func increaseAmountInCartButton(_ sender: Any) {
        if let tempProduct = product {
            productDetailViewViewModel.postProductsInCart(product: tempProduct, siparisAdeti: 1, kullaniciAdi: "onur_akviran")
            // todo amount in cart = getProductsInCart siparis adeti
        }
    }
    @IBAction func decreaseAmountInCartButton(_ sender: Any) {
    }
}
