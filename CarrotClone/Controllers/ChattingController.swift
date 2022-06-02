//
//  ChattingController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

class ChattingController: UIViewController {
    
    var chatDataManager = DataManager()


    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        chatTableView.dataSource = self
        chatTableView.rowHeight = 80
        
        chatDataManager.makechatData()
    }
}

extension ChattingController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDataManager.getchatData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let array = chatDataManager.getchatData()
        let chat = array[indexPath.row]
        
        cell.profileImageView.image = chat.profileImage
        cell.profileNameLabel.text = chat.profileName
        cell.profileLocationLabel.text = chat.profileLocation
        cell.chatDateLabel.text = chat.chatDate
        cell.chatContentLabel.text = chat.chatcontent
        cell.productImageView.image = chat.productImage
        cell.selectionStyle = .none
        
        return cell
    }
}


extension ChattingController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        configureNavigationTitle()
        configureNavigationButton()
    }
    
    func configureNavigationTitle() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "채팅"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    func configureNavigationButton() {
        let scanQRButton = UIBarButtonItem(image: UIImage(systemName: "qrcode.viewfinder"), style: .plain, target: self, action: nil)
        scanQRButton.tintColor = .white
        scanQRButton.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        notificationButton.tintColor = .white
        notificationButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        self.navigationItem.rightBarButtonItems = [notificationButton, scanQRButton]
    }
}





