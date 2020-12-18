//
//  ViewController.swift
//  IndicatorViewPractice
//
//  Created by 윤병일 on 2020/12/19.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController  {

  //MARK: - Properties
  private let button : UIButton = {
    let bt = UIButton()
    bt.setTitle("button", for: .normal)
    bt.setTitleColor(.blue, for: .normal)
    bt.backgroundColor = .yellow
    bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return bt
  }()
  
  let indicator = NVActivityIndicatorView(frame: CGRect(x: 162, y: 100, width: 50, height: 59), type: .circleStrokeSpin, color: .black, padding: 0)
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  //MARK: - configureUI()
  private func configureUI() {
    [button, indicator].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
      button.widthAnchor.constraint(equalToConstant: 80),
      button.heightAnchor.constraint(equalToConstant: 50),
      
      indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  //MARK: - @objc func
  @objc func buttonTapped() {
      self.indicator.startAnimating()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
       let controller = NextPageViewController()
      self.present(controller, animated: true, completion: nil)
    }
  }
}
