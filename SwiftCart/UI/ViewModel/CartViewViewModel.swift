//
//  CartViewViewModel.swift
//  SwiftCart
//
//  Created by Onur Akviran on 4.05.2025.
//

import Foundation
import RxSwift
class CartViewViewModel {
    var productsRepository = ProductsRepository()
    var productsInCartList = BehaviorSubject<[ProductInCart]>(value: [ProductInCart]())
    
    init() {
        productsInCartList = productsRepository.productInCartList
    }
    
    func getProductsInCart(kullaniciAdi: String) {
        productsRepository.getProductsInCart(kullaniciAdi: "String")
    }
}

