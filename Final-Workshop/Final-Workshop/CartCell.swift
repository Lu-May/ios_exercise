//
//  CartCell.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/6.
//

import UIKit


class CartCell: UITableViewCell {
  @IBOutlet weak var nameLable: UILabel!
  @IBOutlet weak var priceLable: UILabel!
  @IBOutlet weak var countLable: UILabel!
  @IBOutlet weak var subtotalLable: UILabel!
  
  func configure(with purchasedItem: PurchasedItem) {
    nameLable.text = purchasedItem.item.name
    priceLable.text = "\(String.init(format:"%.2f", purchasedItem.item.price))元"
    countLable.text = "x\(purchasedItem.count)\(purchasedItem.item.unit)"
    subtotalLable.text = "\(String.init(format:"%.2f", purchasedItem.subtotal))元"
  }
}
