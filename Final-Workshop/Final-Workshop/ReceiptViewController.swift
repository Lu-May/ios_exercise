//
//  CartPageViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ReceiptViewController: UIViewController {
  @IBOutlet weak var receiptLable: UILabel!
  var purchasedItems: [PurchasedItem] = []
  var totalPrice: Float = 0
  var totalPriceWithoutPromotion: Float = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "购物小票"
    var receipt: String = "";
    
    for purcahsed in self.purchasedItems {
      totalPrice += purcahsed.subtotal
      totalPriceWithoutPromotion += Float(purcahsed.count) * purcahsed.item.price
      receipt += "名称：\(purcahsed.item.name)，数量：\(purcahsed.count)\(purcahsed.item.unit)，单价：¥\(purcahsed.item.price)\n小计：¥\(format(purcahsed.subtotal))\n";
    }
    receiptLable.text = """
                        ***Receipts***
                        \(receipt)----------------------
                        总计：¥\(format(totalPrice))
                        节省：¥\(format(totalPriceWithoutPromotion - totalPrice))
                        **********************
                        """
  }
  
  func format(_ variable: Float) -> String {
    return String(format: "%0.2f",variable);
  }
  
  func configure(with purchasedItems: [PurchasedItem]) {
    self.purchasedItems = purchasedItems
  }
}
