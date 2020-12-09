//
//  CustomCell.swift
//  KingFisherPractice
//
//  Created by 윤병일 on 2020/12/09.
//

import UIKit
import Kingfisher

class CustomCell : UICollectionViewCell {
  //MARK: - Properties
  static let identifier = "CustomCell"
  
  
   var imageView = UIImageView()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
      configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI ()
  private func configureUI () {
    contentView.addSubview(imageView)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
//  func setImage(url : String) {
//    imageView.kf.setImage(with: URL(string: url))
//  }
}
