//
//  ViewController.swift
//  IndicatorViewPractice
//
//  Created by 윤병일 on 2020/12/19.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let button : UIButton = {
    let bt = UIButton()
    bt.setTitle("button", for: .normal)
    bt.setTitleColor(.blue, for: .normal)
    bt.backgroundColor = .yellow
    bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return bt
  }()
  
  //MARK: - LifeCycle
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
      button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
      button.widthAnchor.constraint(equalToConstant: 80),
      button.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

  //MARK: - @objc func
  @objc func buttonTapped() {
    print("123")
  }
}

