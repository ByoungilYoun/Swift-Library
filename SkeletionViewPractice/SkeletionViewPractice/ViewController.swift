//
//  ViewController.swift
//  SkeletionViewPractice
//
//  Created by 윤병일 on 2020/12/27.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

  //MARK: - Properties
  lazy var myLabel : UILabel = {
    let l = UILabel()
    l.backgroundColor = .lightGray
    l.textColor = .white
    l.textColor = .black
    l.text = "Hello, welcome to my App"
    l.textAlignment = .center
    return l
  }()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(myLabel)
    
    self.myLabel.translatesAutoresizingMaskIntoConstraints = false
    self.myLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    self.myLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
    self.myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    self.myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
    // skeletionView 적용
    self.myLabel.isSkeletonable = true
    self.myLabel.showAnimatedGradientSkeleton()
    
    // skeletionView 사라지게 하기
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
      self.myLabel.hideSkeleton()
    }
  }
}

