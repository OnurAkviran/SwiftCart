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
    var productInCartList = BehaviorSubject<[ProductInCart]>(value: [ProductInCart]())
    
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
    
    func postProductsInCart(ad:String, resim:String, kategori:String, fiyat:Int, marka:String, siparisAdeti:Int, kullaniciAdi:String){
            let url = baseUrl + "sepeteUrunEkle.php"
        let parameters:Parameters = ["ad":ad, "resim":resim, "kategori":kategori, "fiyat":fiyat, "marka":marka, "siparisAdeti":siparisAdeti, "kullaniciAdi":kullaniciAdi]
            
            AF.request(url, method: .post,parameters: parameters).response{ response in
                if let data = response.data {
                    do {
                        let apiResponse = try JSONDecoder().decode(StandardResponse.self, from: data)
                        print("post status : \(apiResponse.success!)")
                        print(apiResponse.message!)
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
    }
    
    func getProductsInCart(kullaniciAdi:String) {
        let url = baseUrl + "sepettekiUrunleriGetir.php"
        let parameters:Parameters = ["kullaniciAdi":kullaniciAdi]
        
        AF.request(url, method: .post,parameters: parameters).response{ response in
            if let data = response.data {
                do {
                    let apiResponse = try JSONDecoder().decode(ProductInCartList.self, from: data)
                    if let list = apiResponse.urunler_sepeti {
                        self.productInCartList.onNext(list)
                    }
                }catch{
                    print(String(describing: error))
                }
            }
        }
    }
}
