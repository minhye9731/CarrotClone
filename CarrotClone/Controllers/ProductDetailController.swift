//
//  ProductDetailController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/3/22.
//

import UIKit

final class ProductDetailController: UIViewController {
    
    var product: Market?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var sellerImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var likeNumber: UILabel!
    
    @IBOutlet weak var paymentAnnouncementView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        makeUI()
        setupUI()
    }
    
    func makeUI() {
        sellerImage?.layer.cornerRadius = sellerImage.bounds.height / 2
        sellerImage?.clipsToBounds = true
        
        paymentAnnouncementView?.layer.cornerRadius = 8
        paymentAnnouncementView?.layer.masksToBounds = true
    }
    
    func setupUI() {
        sellerImage.image = UIImage(named: "profile6.png")!
        productImage.image = product?.sellingImage
        productName.text = product?.productName
        postDate.text = product?.postDate
        likeNumber.text = product?.likenumber
    }
    

}

// MARK: - navigation bar 상세설정
extension ProductDetailController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        configureNavigationButton()
    }
    
    func configureNavigationButton() {
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        searchButton.tintColor = .white
        searchButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        let categoryButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: nil)
        categoryButton.tintColor = .white
        categoryButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        notificationButton.tintColor = .white
        notificationButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationItem.rightBarButtonItems = [notificationButton, categoryButton, searchButton]
    }
}
