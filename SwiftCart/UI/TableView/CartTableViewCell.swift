//
//  CartTableViewCell.swift
//  SwiftCart
//
//  Created by Onur Akviran on 4.05.2025.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var cartImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
