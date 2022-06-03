//
//  DailyLifeController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/3/22.
//

import UIKit

class DailyLifeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configurePlusButton()
        
    }
    
    func configurePlusButton() {
        let plusButton = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 23, weight: .semibold)
        
        plusButton.setImage(UIImage(systemName: "plus", withConfiguration: configuration), for: .normal)
        plusButton.tintColor = .white
        plusButton.backgroundColor = .orange
        plusButton.frame = CGRect(x: 310, y: 590, width: 60, height: 60)
        plusButton.layer.cornerRadius = plusButton.bounds.height / 2
        plusButton.clipsToBounds = true
        
        view.addSubview(plusButton)
//        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)

    }
    
    @objc func plusButtonTapped() {
        
    }
    
    
}



extension DailyLifeController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        configureNavigationTitle()
        configureNavigationButton()
    }
    
    func configureNavigationTitle() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "어딘가00동 ⌵"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    func configureNavigationButton() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        searchButton.tintColor = .white
        searchButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        let categorystarButton = UIBarButtonItem(image: UIImage(systemName: "list.star"), style: .plain, target: self, action: nil)
        categorystarButton.tintColor = .white
        categorystarButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        notificationButton.tintColor = .white
        notificationButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        self.navigationItem.rightBarButtonItems = [notificationButton, categorystarButton, searchButton]
    }
}
