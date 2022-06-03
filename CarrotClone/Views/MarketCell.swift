//
//  MarketCell.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

class MarketCell: UITableViewCell {
    
    var product: Market? {
        didSet {
            guard let product = product else { return }
            sellingImage.image = product.sellingImage
            productNameLabel.text = product.productName
            sellerLocationLabel.text = product.sellerLocation
            postDateLabel.text = product.postDate
            productPriceLabel.text = product.productPrice
            likenumberLabel.text = product.likenumber
        }
    }

    @IBOutlet weak var sellingImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var sellerLocationLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var likenumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        sellingImage.layer.cornerRadius = 8
        sellingImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateUI(cellData: [Market]) {
        self.sellingImage.image = product?.sellingImage
        self.productNameLabel.text = product?.productName
        self.sellerLocationLabel.text = product?.sellerLocation
        self.postDateLabel.text = product?.postDate
        self.productPriceLabel.text = product?.productPrice
        self.likenumberLabel.text = product?.likenumber
    }

}
