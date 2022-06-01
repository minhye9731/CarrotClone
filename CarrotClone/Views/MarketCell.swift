//
//  MarketCell.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

class MarketCell: UITableViewCell {

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

}
