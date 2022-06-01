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




