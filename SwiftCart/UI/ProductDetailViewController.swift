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
    let baseImageUrl = "http://kasimadalan.pe.hu/urunler/resimler/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage(filename: "saat.png")
    }
    
    func displayImage(filename: String) {
        
        guard let encodedFilename = filename.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: baseImageUrl + encodedFilename) else {
            print("Invalid filename or URL")
            return
        }
        
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "exclamationmark.arrow.trianglehead.2.clockwise.rotate.90"),
            options: [.transition(.fade(0.2))],
            completionHandler: { result in
                switch result {
                case .success:
                    break
                case .failure(let error):
                    print("Image loading failed: \(error)")
                }
            }
        )
    }
}
