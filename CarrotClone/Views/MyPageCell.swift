//
//  MyPageCell.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/2/22.
//

import UIKit

class MyPageCell: UITableViewCell {
    
    static let identifier = "MyPageCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconImageView.frame = CGRect(x: 10, y: 6, width: size, height: size)
        
        label.frame = CGRect(x: 15 + iconImageView.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 15 - iconImageView.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
    }
    
    public func configure(with model: MyPageOption) {
        label.text = model.title
        iconImageView.image = model.icon
    }
    
    
}
