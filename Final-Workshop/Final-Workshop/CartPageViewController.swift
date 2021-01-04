//
//  CartPageViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class CartPageViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
 
  @IBAction func clickBackToItemList(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
