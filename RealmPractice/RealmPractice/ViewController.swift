//
//  ViewController.swift
//  RealmPractice
//
//  Created by 윤병일 on 2020/12/12.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let textField : UITextField = {
    let tf = UITextField()
    tf.layer.borderWidth = 1
    tf.layer.borderColor = UIColor.black.cgColor
    return tf
  }()
  
  private let myButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Click", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.backgroundColor = .yellow
    bt.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    return bt
  }()
  
  private let tableView = UITableView()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    
  }
  
  //MARK: - configureUI ()
  private func configureUI () {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.tableFooterView = UIView()
    
    [textField, myButton, tableView].forEach {
      view.addSubview($0)
    }
    
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      textField.widthAnchor.constraint(equalToConstant: 300),
      textField.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    myButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      myButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
    ])
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      
    ])
  }
  
  @objc func btnClick() {
    print("button clicked..")
  }

}

//MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "hi"
    return cell
  }
  
  
}

//MARK: - UITableViewDelegate
extension ViewController : UITableViewDelegate {
  
}
