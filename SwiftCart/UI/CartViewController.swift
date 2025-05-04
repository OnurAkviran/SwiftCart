//
//  CartViewController.swift
//  SwiftCart
//
//  Created by Onur Akviran on 2.05.2025.
//

import UIKit

class CartViewController: UIViewController {
    
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    @IBOutlet weak var cartTableView: UITableView!
    
    var cartViewViewModel = CartViewViewModel()
    let kullaniciAdi = "onur_akviran"
    
    var productsInCartList = [ProductInCart]()
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        _ = cartViewViewModel.productsInCartList.subscribe(onNext: { list in self.productsInCartList = list
            DispatchQueue.main.async{
                self.cartTableView.reloadData()
            }})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartViewViewModel.getProductsInCart(kullaniciAdi:kullaniciAdi)
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productsInCartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableView", for: indexPath) as! ProductTableViewCell
        let productInCart = productsInCartList[indexPath.row]
        
        cell.nameLabel.text = productInCart.ad
        cell.routeLabel.text = productInCart.marka
        cell.priceLabel.text = String(productInCart.fiyat!) + "₺"
        cell.imageView?.displayImage(baseImageUrl: baseImageUrl, filename: productInCart.resim!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productInCart = productsInCartList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: productInCart)
    }
}
