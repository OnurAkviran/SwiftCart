//
//  Extension.swift
//  SwiftCart
//
//  Created by Onur Akviran on 3.05.2025.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    
    func displayImage(baseImageUrl: String,filename: String) {
        
        guard let encodedFilename = filename.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: baseImageUrl + encodedFilename) else {
            print("Invalid filename or URL")
            return
        }
        
        self.kf.setImage(
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
