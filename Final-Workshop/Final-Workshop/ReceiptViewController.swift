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

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "购物小票"
    var receipt: String = "";

    for purcahsed in self.purchasedItems {
      totalPrice += purcahsed.subtotal
      receipt += "名称：\(purcahsed.item.name)，数量：\(purcahsed.count)\(purcahsed.item.unit)，单价：\(purcahsed.item.price)(元)\n小计：\(format(purcahsed.subtotal))(元)\n";
    }
    receiptLable.text = """
***Receipts***
\(receipt)----------------------
总计：\(format(totalPrice))(元)
**********************
"""
  }
  
  func format(_ variable: Float) -> String {
    return String(format: "%0.2f",variable);
  }
  
  func configure(with purchasedItems: [PurchasedItem]) {
    self.purchasedItems = purchasedItems
  }
  
  @IBAction func clickBackToItemList(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
