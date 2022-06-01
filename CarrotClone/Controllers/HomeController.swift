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
