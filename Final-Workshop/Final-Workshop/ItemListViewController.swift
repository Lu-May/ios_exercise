//
//  ItemListViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ItemListViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
 
  @IBAction func clickForwardToCartPage(_ sender: Any) {
    let cartPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartPageViewController")
    show(cartPageViewController, sender: self)
  }
}
