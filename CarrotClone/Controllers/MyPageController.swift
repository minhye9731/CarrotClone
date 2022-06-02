//
//  MyPageController.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/2/22.
//

import UIKit

// 마이페이지 섹션내 제목 구성내용
struct Section {
    var title: String
    let options: [MyPageOption]
}

// 마이페이지 섹션내 내용 구성요소
struct MyPageOption {
    let title: String
    let icon: UIImage?
    let handler: (() -> Void)
}


class MyPageController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let mypageTableView: UITableView = {
        let mypagetable = UITableView(frame: .zero, style: .grouped)
        mypagetable.register(MyPageCell.self,
                             forCellReuseIdentifier: MyPageCell.identifier)
        return mypagetable
    }()
    
    var models = [Section]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        mypageTableView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        
        configure()
        view.addSubview(mypageTableView)
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        mypageTableView.frame = view.bounds
        mypageTableView.backgroundColor = .black
    }

    
    func configure() {
        
        models.append(Section(title: "나의 활동", options: [
            MyPageOption(title: "내 동네 설정", icon: UIImage(systemName: "mappin.circle")) { print("클릭했습니다.") },
            MyPageOption(title: "동네 인증하기", icon: UIImage(systemName: "location.viewfinder")) { print("클릭했습니다.") },
            MyPageOption(title: "키워드 알림", icon: UIImage(systemName: "tag")) { print("클릭했습니다.") },
            MyPageOption(title: "모아보기", icon: UIImage(systemName: "square.grid.2x2")) { print("클릭했습니다.") },
            MyPageOption(title: "당근가계부", icon: UIImage(systemName: "text.book.closed")) { print("클릭했습니다.") },
            MyPageOption(title: "관심 카테고리 설정", icon: UIImage(systemName: "slider.horizontal.below.rectangle")) { print("클릭했습니다.") }
        ]))
        models.append(Section(title: "우리 동네", options: [
            MyPageOption(title: "동네생활 글/댓글", icon: UIImage(systemName: "square.and.pencil")) { print("클릭했습니다.") },
            MyPageOption(title: "동네홍보 글", icon: UIImage(systemName: "newspaper")) { print("클릭했습니다.") },
            MyPageOption(title: "동네 가게 후기", icon: UIImage(systemName: "text.bubble")) { print("클릭했습니다.") },
            MyPageOption(title: "내 단골 가게", icon: UIImage(systemName: "house")) { print("클릭했습니다.") },
            MyPageOption(title: "받은 쿠폰함", icon: UIImage(systemName: "ticket")) { print("클릭했습니다.") }
        ]))
        models.append(Section(title: "사장님 메뉴", options: [
            MyPageOption(title: "비즈프로필 만들기", icon: UIImage(systemName: "house.circle")) { print("클릭했습니다.") },
            MyPageOption(title: "지역광고", icon: UIImage(systemName: "megaphone")) { print("클릭했습니다.") }
        ]))
        models.append(Section(title: "기타", options: [
            MyPageOption(title: "친구초대", icon: UIImage(systemName: "envelope")) { print("클릭했습니다.") },
            MyPageOption(title: "공지사항", icon: UIImage(systemName: "mic")) { print("클릭했습니다.") },
            MyPageOption(title: "자주 묻는 질문", icon: UIImage(systemName: "person.fill.questionmark")) { print("클릭했습니다.") },
            MyPageOption(title: "앱 설정", icon: UIImage(systemName: "gear")) { print("클릭했습니다.") }
        ]))
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        header.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)

        let label = UILabel(frame: CGRect(x: 18, y: 10,
                                          width: header.frame.size.width,
                                          height: header.frame.size.height - 10))
        header.addSubview(label)
        label.text = models[section].title
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return header
    }
    
 
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = mypageTableView.dequeueReusableCell(
            withIdentifier: MyPageCell.identifier,
            for: indexPath
        ) as? MyPageCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}



extension MyPageController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        configureNavigationTitle()
        configureNavigationButton()
    }
    
    func configureNavigationTitle() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "나의 당근"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    func configureNavigationButton() {
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.circle"), style: .plain, target: self, action: nil)
        settingButton.tintColor = .white
        settingButton.customView?.translatesAutoresizingMaskIntoConstraints = false

        self.navigationItem.rightBarButtonItems = [settingButton]
    }
}
