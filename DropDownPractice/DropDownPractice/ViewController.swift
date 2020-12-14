//
//  ViewController.swift
//  DropDownPractice
//
//  Created by 윤병일 on 2020/12/15.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let button : UIButton = {
    let bt = UIButton()
    bt.setTitle("Drop Down", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.backgroundColor = .yellow
    return bt
  }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }


  //MARK: - configureUI()
  private func configureUI() {
    view.addSubview(button)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}

