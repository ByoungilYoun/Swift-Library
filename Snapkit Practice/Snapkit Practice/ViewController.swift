//
//  ViewController.swift
//  Snapkit Practice
//
//  Created by 윤병일 on 2020/12/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  //MARK: - Properties
  lazy var view1 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.black
    return view
  }()
  
  lazy var view2 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.cyan
    return view
  }()
  
  lazy var view3 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.blue
    return view
  }()
  
  lazy var view4 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.darkGray
    return view
  }()
  
  lazy var view5 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.magenta
    return view
  }()
  
  lazy var view6 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.red
    return view
  }()
  
  lazy var view7 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.gray
    return view
  }()
  
  lazy var view8 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.orange
    return view
  }()
  
  lazy var view9 : UIView = {
    var view = UIView()
    view.backgroundColor = UIColor.systemPink
    return view
  }()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  //MARK: - configureUI()
  private func configureUI() {
    view.addSubview(view1)
    view1.snp.makeConstraints {
      $0.width.equalTo(view)
      $0.height.equalTo(64)
      $0.top.equalTo(view).offset(44)
    }
    
    view1.addSubview(view2)
    view2.snp.makeConstraints {
//      $0.width.equalTo(view1.snp.height)
//      $0.height.equalTo(view1.snp.height)
      $0.width.height.equalTo(view1.snp.height)
      $0.left.equalTo(view1) // 같을 경우 생략 가능 view1.snp.left 대신 view1만
      $0.top.equalTo(view1)
    }
    
    view1.addSubview(view3)
    view3.snp.makeConstraints {
      $0.width.equalTo(view1.snp.height)
      $0.height.equalTo(view1.snp.height)
      $0.right.equalTo(view1)
      $0.top.equalTo(view1)
    }
    
    view.addSubview(view4)
    view4.snp.makeConstraints {
      $0.width.equalTo(view.snp.width).dividedBy(4)
      $0.height.equalTo(view.snp.width).dividedBy(4)
      $0.left.equalTo(view.snp.left)
      $0.bottom.equalTo(view).offset(-34)
    }
    
    view.addSubview(view5)
    view5.snp.makeConstraints {
      $0.width.equalTo(view.snp.width).dividedBy(4)
      $0.height.equalTo(view.snp.width).dividedBy(4)
      $0.left.equalTo(view4.snp.right)
      $0.bottom.equalTo(view).offset(-34)
    }
    
    view.addSubview(view6)
    view6.snp.makeConstraints {
      $0.width.equalTo(view.snp.width).dividedBy(4)
      $0.height.equalTo(view.snp.width).dividedBy(4)
      $0.left.equalTo(view5.snp.right)
      $0.bottom.equalTo(view).offset(-34)
    }
    
    view.addSubview(view7)
    view7.snp.makeConstraints {
      $0.width.equalTo(view.snp.width).dividedBy(4)
      $0.height.equalTo(view.snp.width).dividedBy(4)
      $0.left.equalTo(view6.snp.right)
      $0.bottom.equalTo(view).offset(-34)
    }
    
    view.addSubview(view8)
    view8.snp.makeConstraints {
      $0.left.equalTo(view)
      $0.right.equalTo(view)
      $0.top.equalTo(view1.snp.bottom)
      $0.bottom.equalTo(view7.snp.top)
    }
    
    view.addSubview(view9)
    view9.snp.makeConstraints {
      $0.edges.equalTo(view8).inset(30) // view9 은 view8 과 같게 만든다음에 상하좌우를 30 정도 줄여준다.
    }
  }
}

