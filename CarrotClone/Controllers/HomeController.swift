//
//  HomeController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

class HomeController: UIViewController {
    
    var marketDataManager = DataManager()

    @IBOutlet weak var marketTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        marketTableView.dataSource = self
        marketTableView.rowHeight = 140
        
        marketDataManager.makeMarketData()
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketDataManager.getMarketData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as! MarketCell
        
        let array = marketDataManager.getMarketData()
        let market = array[indexPath.row]
        
        cell.sellingImage.image = market.sellingImage
        cell.productNameLabel.text = market.productName
        cell.sellerLocationLabel.text = market.sellerLocation
        cell.postDateLabel.text = market.postDate
        cell.productPriceLabel.text = market.productPrice
        cell.likenumberLabel.text = market.likenumber
        cell.selectionStyle = .none
        
        return cell
    }
}

extension HomeController {
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

        let categoryButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: nil)
        categoryButton.tintColor = .white
        categoryButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        notificationButton.tintColor = .white
        notificationButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        self.navigationItem.rightBarButtonItems = [notificationButton, categoryButton, searchButton]
    }
}


