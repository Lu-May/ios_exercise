//
//  ItemCell.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ItemCell: UITableViewCell {
  @IBOutlet weak var nameLable: UILabel!
  
  func configure(with item: Item) {
    nameLable.text = item.name
  }
}
