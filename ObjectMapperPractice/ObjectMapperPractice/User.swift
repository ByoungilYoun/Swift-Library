//
//  User.swift
//  ObjectMapperPractice
//
//  Created by 윤병일 on 2020/12/04.
//

import UIKit
import ObjectMapper

class User : Mappable {
  
  var name : String?
  var age : String?
  var city : String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    age <- map["age"]
    city <- map["city"]
  }

}
