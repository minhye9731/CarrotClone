//
//  NearByController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/3/22.
//

import UIKit

class NearByController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    

   

}


extension NearByController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        configureNavigationTitle()
        configureNavigationButton()
    }
    
    func configureNavigationTitle() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "내 근처"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    func configureNavigationButton() {
        
//        // 얘는 슬라이딩할때만 나타남
//        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
//        searchButton.tintColor = .white
//        searchButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        let selectCategoryButton = UIBarButtonItem(image: UIImage(systemName: "highlighter"), style: .plain, target: self, action: nil)
        selectCategoryButton.tintColor = .white
        selectCategoryButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let scanQRButton = UIBarButtonItem(image: UIImage(systemName: "qrcode.viewfinder"), style: .plain, target: self, action: nil)
        scanQRButton.tintColor = .white
        scanQRButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        notificationButton.tintColor = .white
        notificationButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        self.navigationItem.rightBarButtonItems = [notificationButton, scanQRButton, selectCategoryButton]
    }
}
