//
//  HomeViewViewModel.swift
//  SwiftCart
//
//  Created by Onur Akviran on 4.05.2025.
//

import Foundation
import RxSwift
class HomeViewViewModel {
    var productsRepository = ProductsRepository()
    var productsList = BehaviorSubject<[Product]>(value: [Product]())
    
    init() {
        productsList = productsRepository.productList
    }
    
    func getProducts() {
        productsRepository.getProducts()
    }
}
