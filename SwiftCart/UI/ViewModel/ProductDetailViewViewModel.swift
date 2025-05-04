//
//  ProductDetailViewViewModel.swift
//  SwiftCart
//
//  Created by Onur Akviran on 4.05.2025.
//

import Foundation
import RxSwift

class ProductDetailViewViewModel {
    var productsRepository = ProductsRepository()
    var productsInCartList = BehaviorSubject<[ProductInCart]>(value: [ProductInCart]())
    
    init() {
        productsInCartList = productsRepository.productInCartList
    }
    
    func getProductsInCart(){
        productsRepository.getProductsInCart(kullaniciAdi: "onur_akviran")
    }
    
    func postProductsInCart(product: Product, siparisAdeti: Int, kullaniciAdi: String) {
        productsRepository.postProductsInCart(ad: product.ad, resim: product.resim, kategori: product.kategori, fiyat: product.fiyat, marka: product.marka, siparisAdeti: siparisAdeti, kullaniciAdi: kullaniciAdi)
    }
}
