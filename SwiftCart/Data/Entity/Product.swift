//
//  Product.swift
//  SwiftCart
//
//  Created by Onur Akviran on 1.05.2025.
//

import Foundation

class Product : Codable {
    var id: Int
    var ad: String //name
    var resim: String //image
    var kategori: String //category
    var fiyat: Int //price
    var marka: String //brand
    
    public init(id: Int, ad: String, resim: String, kategori: String, fiyat: Int, marka: String) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.kategori = kategori
        self.fiyat = fiyat
        self.marka = marka
    }
}
