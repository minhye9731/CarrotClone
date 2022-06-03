//
//  HomeController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

final class HomeController: UIViewController {
    
    @IBOutlet weak var marketTableView: UITableView!
    
    var marketDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        setupDatas()
        setupTableView()
        configurePlusButton()
        setNavigationBar()
    }
    
    // MARK: - 서버에서 데이터 요청
    func setupDatas() {
        marketDataManager.makeMarketData()
    }
    
    // MARK: - 테이블뷰 세팅
    func setupTableView() {
        marketTableView.dataSource = self
        marketTableView.delegate = self
        marketTableView.rowHeight = 140
    }
    
    // MARK: - 플러스 버튼 설정
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
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    // + 버튼 눌렀을
    @objc func plusButtonTapped(_ sender: UIButton) {
        // 데이터를 추가한다.
        marketDataManager.addMarketData()
//        tableView.reloadData()
    }
    
}

// MARK: - tableview 상세설정
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketDataManager.getMarketData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as! MarketCell
        
        cell.updateUI(cellData: marketDataManager.getMarketData())
        
        cell.product = marketDataManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! ProductDetailController
            
            let array = marketDataManager.getMarketData()
            
            let indexPath = sender as! IndexPath
            
            detailVC.product = array[indexPath.row]
        }
    }
    
}

// MARK: - navigation bar 상세설정
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


