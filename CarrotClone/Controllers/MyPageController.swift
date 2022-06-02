//
//  MyPageController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/2/22.
//

import UIKit

struct MyPageOption {
    let title: String
    let icon: UIImage?
}


class MyPageController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let mypageTableView: UITableView = {
        let mypagetable = UITableView(frame: .zero, style: .grouped)
        mypagetable.register(MyPageCell.self,
                             forCellReuseIdentifier: MyPageCell.identifier)
        return mypagetable
    }()
    
    var models = [MyPageOption]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.addSubview(mypageTableView)
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        mypageTableView.frame = view.bounds
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        mypageTableView.frame = view.bounds
//    }
    
    func configure() {
        self.models = Array(0...100).compactMap({
            MyPageOption(title: "Item \($0)", icon: UIImage(systemName: "house"))
                
        })
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Title \(section)"
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = mypageTableView.dequeueReusableCell(withIdentifier: MyPageCell.identifier, for: indexPath
        ) as? MyPageCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }


}
