//
//  CartPageViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ReceiptViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "购物小票"
  }
  
  @IBAction func clickBackToItemList(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
