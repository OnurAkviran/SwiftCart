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
    var homeViewViewModel = HomeViewViewModel()
    
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SwiftCart"
        productTableView.delegate = self
        productTableView.dataSource = self
        
        _ = homeViewViewModel.productsList.subscribe(onNext: { list in self.productList = list
            DispatchQueue.main.async{
                self.productTableView.reloadData()
            }})
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font:UIFont(name: "Yesteryear-Regular", size: 32)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeViewViewModel.getProducts()
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
    }
}
