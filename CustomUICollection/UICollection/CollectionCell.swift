//
//  CollectionCell.swift
//  UICollection
//
//  Created by Yuehuan Lu on 2021/1/13.
//

import UIKit

class CollectionCell: UICollectionViewCell {
  @IBOutlet var imageView: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView = UIImageView()
    imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
    addSubview(imageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
