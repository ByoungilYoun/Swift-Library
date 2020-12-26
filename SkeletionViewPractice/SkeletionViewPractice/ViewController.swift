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
  lazy var myView : UIView = {
    let v = UIView()
    v.backgroundColor = .lightGray
    return v
  }()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(myView)
    
    self.myView.translatesAutoresizingMaskIntoConstraints = false
    self.myView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    self.myView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    self.myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
    // skeletionview 적용
    self.myView.isSkeletonable = true
    self.myView.showAnimatedGradientSkeleton()
    
  }


}

