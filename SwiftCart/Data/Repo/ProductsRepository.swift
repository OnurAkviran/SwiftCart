//
//  ProductsRepository.swift
//  SwiftCart
//
//  Created by Onur Akviran on 1.05.2025.
//

import Foundation
import Alamofire
import RxSwift

class ProductsRepository {
    let baseUrl = "http://kasimadalan.pe.hu/urunler/"
    var productList = BehaviorSubject<[Product]>(value: [Product]())
    
    
    func getProducts() {
        let url = baseUrl + "tumUrunleriGetir.php"
        AF.request(url, method: .get).response{ response in
            if let data = response.data {
                do {
                    let apiResponse = try JSONDecoder().decode(ProductList.self, from: data)
                    if let list = apiResponse.urunler {
                        self.productList.onNext(list)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
