//
//  ChatDataManager.swift
//  CarrotClone
//
//  Created by 강민혜 on 6/1/22.
//

import UIKit

class DataManager {
    var chatDataArray: [Chat] = []
    var marketDataArray: [Market] = []
    
    func makechatData() {
        chatDataArray = [
            Chat(profileImage: UIImage(named: "profile1.png")!, profileName: "고길동", profileLocation: "연희동", chatDate: "1주 전", chatcontent: "너무 비싸네요. 1만원 네고합시다.", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile2.png")!, profileName: "튤립사랑", profileLocation: "북아현동", chatDate: "2주 전", chatcontent: "홍대입구역 8번 출구 앞에서 뵈어요~^^", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile6.png")!, profileName: "네고왕", profileLocation: "여의도동", chatDate: "2주 전", chatcontent: "네고왕님이 이모티콘을 보냈어요.", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile4.png")!, profileName: "한사랑산악회", profileLocation: "영등포동", chatDate: "3주 전", chatcontent: "열정열정열정!!", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile5.png")!, profileName: "마동석", profileLocation: "만리동", chatDate: "4주 전", chatcontent: "네 나가겠습니다.", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile6.png")!, profileName: "록시땅", profileLocation: "청진동", chatDate: "1달 전", chatcontent: "록시땅 핸드크림 사실래요?", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile7.png")!, profileName: "Anne", profileLocation: "소공동", chatDate: "1달 전", chatcontent: "Hi", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile8.png")!, profileName: "배고파", profileLocation: "필동", chatDate: "2달 전", chatcontent: "딸기 생크림 케이크 먹고싶다.", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile3.png")!, profileName: "멍멍이", profileLocation: "한남동", chatDate: "2달 전", chatcontent: "도착했습니다~!", productImage: UIImage(named: "product.png")!),
            Chat(profileImage: UIImage(named: "profile6.png")!, profileName: "싸게직거래", profileLocation: "이태원동", chatDate: "5달 전", chatcontent: "heyhey yoyoyoyoyoyo", productImage: UIImage(named: "product.png")!)
        ]
    }
    
    func makeMarketData() {
        marketDataArray = [
            Market(sellingImage: UIImage(named: "selling1.pnf")!, productName: "원목 테이블 의자 세트 판매합니다.", sellerLocation: "연남동", postDate: "7분 전", productPrice: "100,000원", likenumber: "18"),
            Market(sellingImage: UIImage(named: "selling2.pnf")!, productName: "탁상용 선풍기", sellerLocation: "여의도동", postDate: "11분 전", productPrice: "8,000원", likenumber: "3"),
            Market(sellingImage: UIImage(named: "selling3.pnf")!, productName: "블랙 기계식 키보드 사실 분", sellerLocation: "필동", postDate: "30분 전", productPrice: "5,000원", likenumber: "25"),
            Market(sellingImage: UIImage(named: "selling4.pnf")!, productName: "포케몬 스티커!!", sellerLocation: "서교동", postDate: "23시간 전", productPrice: "1,000원", likenumber: "2"),
            Market(sellingImage: UIImage(named: "selling5.pnf")!, productName: "회색 후드티 1번입음", sellerLocation: "동교동", postDate: "1일 전", productPrice: "20,000원", likenumber: "4"),
            Market(sellingImage: UIImage(named: "selling6.pnf")!, productName: "iptime 와이파이 공유기 + 랜선", sellerLocation: "연남동", postDate: "7분 전", productPrice: "15,000원", likenumber: "33"),
            Market(sellingImage: UIImage(named: "selling1.pnf")!, productName: "원목 테이블 의자 세트 판매합니다.", sellerLocation: "연남동", postDate: "7분 전", productPrice: "100,000원", likenumber: "18"),
            Market(sellingImage: UIImage(named: "selling2.pnf")!, productName: "원목 테이블 의자 세트 판매합니다.", sellerLocation: "연남동", postDate: "7분 전", productPrice: "100,000원", likenumber: "18")
        ]
    }
    
    func getchatData() -> [Chat] { return chatDataArray }
    func getMarketData() -> [Market] { return marketDataArray }
    
}
