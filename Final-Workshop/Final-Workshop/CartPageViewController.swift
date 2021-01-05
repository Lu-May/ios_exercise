//
//  ItemListViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class CartPageViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "购物车"
  }
 
  @IBAction func clickForwardToCartPage(_ sender: Any) {
    let cartPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ReceiptViewController")
    show(cartPageViewController, sender: self)
  }
}
