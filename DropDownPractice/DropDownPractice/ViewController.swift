//
//  ViewController.swift
//  DropDownPractice
//
//  Created by 윤병일 on 2020/12/15.
//

import UIKit
import DropDown

class ViewController: UIViewController {

  //MARK: - Properties
  private let button : UIButton = {
    let bt = UIButton()
    bt.setTitle("Drop Down", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.backgroundColor = .yellow
    return bt
  }()
    
  var dropDown : DropDown?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    makeDropDown()
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
  
  private func makeDropDown() {
    dropDown = DropDown()
    
    // The view to which the drop down will appear on
    dropDown?.anchorView = button // UIView or UIBarButtonItem
    
    // 버튼 바로 밑으로 안가려지게 나타나게 하는 bottomOffset
    dropDown?.bottomOffset = CGPoint(x: 0, y: (dropDown?.anchorView?.plainView.bounds.height)! + 40)
    // The list of items to display. Can be changed dynamically
    dropDown?.dataSource = ["Car", "Motorcycle", "Truck"]
    // Do any additional setup after loading the view, typically from a nib
    
    button.addTarget(self, action: #selector(dropDownButton), for: .touchUpInside)
    
    dropDown?.selectionAction = { [unowned self] (index : Int, item : String) in
      button.setTitle(item, for: .normal)
    }
    
  }
  
  @objc func dropDownButton() {
    dropDown?.show()
  }
}

