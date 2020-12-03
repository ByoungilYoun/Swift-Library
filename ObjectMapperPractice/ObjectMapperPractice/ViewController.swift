//
//  ViewController.swift
//  ObjectMapperPractice
//
//  Created by 윤병일 on 2020/12/04.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let json_str = """
        {"name": "John", "age" : 31, "city" : "New York"}
    """
    
    let user = User(JSONString: json_str)
    print((user?.name)!)
    print((user?.age)!)
    print((user?.city)!)
  }


}

