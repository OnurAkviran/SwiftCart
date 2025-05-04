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
    @IBOutlet weak var amountInCartTextField: UITextField!
    var amountInCart:Int = 0
    var productDetailViewViewModel = ProductDetailViewViewModel()
    
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    
    var product:Product?
    var productInCart: ProductInCart?
    var productInCartList = [ProductInCart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempProduct = product {
            imageView.displayImage(baseImageUrl: baseImageUrl, filename: product!.resim)
            nameLabel.text = tempProduct.ad
            brandLabel.text = tempProduct.marka
            priceLabel.text = "\(tempProduct.fiyat)₺"
            
            if let productInCart = productInCartList.first(where: { $0.ad == tempProduct.ad }) {
                print("Found product: \(productInCart.ad!)")
            } else {
                print("Product not found.")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productDetailViewViewModel.getProductsInCart(kullaniciAdi: "onur_akviran")
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        if let siparisAdeti = amountInCartTextField.text{
            amountInCart = Int(siparisAdeti)!
        }
            if let tempProduct = product {
                productDetailViewViewModel.postProductsInCart(product: tempProduct, siparisAdeti: amountInCart, kullaniciAdi: "onur_akviran")
                // todo amount in cart = getProductsInCart siparis adeti
            }
    }
}
