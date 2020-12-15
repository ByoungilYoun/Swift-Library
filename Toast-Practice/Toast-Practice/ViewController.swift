//
//  ViewController.swift
//  Toast-Practice
//
//  Created by 윤병일 on 2020/12/15.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {

  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // 기본 토스트 메세지 날리기
//    self.view.makeToast("토스트 메세지 입니다.")
    
    // 이미지를 이용해서도 사용할 수 있다.
    self.view.makeToast("This is a piece of toast", duration: 5.0, position : .bottom, title: "Toast Title", image: #imageLiteral(resourceName: "Ben")) { didTap in
      if didTap {
        // 탭을 했을때
        print("completion from tap")
      } else {
        // 탭을 하지 않았을때
        print("completion without tap")
      }
    }
  }


}
