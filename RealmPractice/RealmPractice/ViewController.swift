//
//  ViewController.swift
//  RealmPractice
//
//  Created by 윤병일 on 2020/12/12.
//

import UIKit
import RealmSwift

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
  
  var notificationToken : NotificationToken?
  var realm : Realm?
  var items : Results<Cart>?
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    
    // Migration 이 필요할때, 데이터베이스 초기화
    let config = Realm.Configuration( deleteRealmIfMigrationNeeded: true)
    
    Realm.Configuration.defaultConfiguration = config
    
    realm = try! Realm()
    
    // Cart 데이터들을 수집하는 코드
    items = realm?.objects(Cart.self) // Cart 로 구성된 database 가 items 에 들어가게 된다.
    
    // Push Driven 작동 시키는 코드 (database 에 변경사항이 있을때 reload 를 한다.)
    notificationToken = realm?.observe({ (noti, realm) in
      self.tableView.reloadData()
    })
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    notificationToken?.invalidate()
    
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
    let cart = Cart()
    cart.name = textField.text!
    try! realm?.write {
      realm?.add(cart)
    }
  }

}

//MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (items?.count)!
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = items![indexPath.row].name
    return cell
  }
  
  
}

//MARK: - UITableViewDelegate
extension ViewController : UITableViewDelegate {
  
}
