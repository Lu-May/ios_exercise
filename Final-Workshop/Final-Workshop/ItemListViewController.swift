//
//  ItemListViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ItemListViewController: UIViewController {
  
  // Figure out the order of a `UIViewController`'s lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("\(Date().timeIntervalSince1970)  page1: viewDidLoad")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(Date().timeIntervalSince1970)  page1: viewWillAppear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\(Date().timeIntervalSince1970)  page1: viewDidAppear")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(Date().timeIntervalSince1970)  page1: viewWillDisappear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\(Date().timeIntervalSince1970)  page1: viewDidDisappear")
  }
  
  @IBAction func clickForwardToCartPage(_ sender: Any) {
    let cartPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartPageViewController")
    show(cartPageViewController, sender: self)
  }
}
