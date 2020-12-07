//
//  ViewController.swift
//  AlamofirePractice(NaverPapago)
//
//  Created by 윤병일 on 2020/12/08.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    var url = "https://openapi.naver.com/v1/papago/n2mt"
    var params = ["source":"ko",
                  "target":"en",
                  "text":"만나서 반갑습니다."]
    var header = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
                  "X-Naver-Client-Id":"s1rLaCZwXZr0ucfihipC",
                  "X-Naver-Client-Secret":"UBztJN1c8F"]
    
    Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseObject { (response : DataResponse<PapagoDTO>) in  // < > 안에는 어떤 클래스를 받을건지 입력해준다
      var papagoDTO = response.result.value
      print(papagoDTO?.message?.result?.translatedText)
    }
  }


}

