//
//  ViewController.swift
//  SwiftCart
//
//  Created by Onur Akviran on 29.04.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productTableView: UITableView!
    
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftCart"
        productTableView.delegate = self
        productTableView.dataSource = self
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font:UIFont(name: "Yesteryear-Regular", size: 32)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        let p1 = Product(id: 1, ad: "Saat", resim: "saat.png", kategori: "aksesuar", fiyat: 25, marka: "casio")
        let p2 = Product(id: 2, ad: "ruj", resim: "ruj.png", kategori: "moda", fiyat: 12, marka: "l'oreal")
        let p3 = Product(id: 3, ad: "Bilgisayar", resim: "bilgisayar.png", kategori: "elektronik", fiyat: 720, marka: "asus")
        productList.append(p1)
        productList.append(p2)
        productList.append(p3)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let destinationProduct = sender as? Product {
                let destinationViewController = segue.destination as! ProductDetailViewController
                destinationViewController.product = destinationProduct
            }
        }
    }


}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = productList[indexPath.row]
        
        cell.nameLabel.text = product.ad
        cell.routeLabel.text = product.kategori + ">" + product.marka
        cell.priceLabel.text = "₺" + String(product.fiyat)
        cell.imageView?.displayImage(baseImageUrl: baseImageUrl, filename: product.resim)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: product)
        print("tiklandi: \(product.ad)" )
    }
}
