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
    print("\(Date().timeIntervalSince1970)  page2: viewDidLoad")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(Date().timeIntervalSince1970)  page2: viewWillAppear")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\(Date().timeIntervalSince1970)  page2: viewDidAppear")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(Date().timeIntervalSince1970)  page2: viewWillDisappear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\(Date().timeIntervalSince1970)  page2: viewDidDisappear")
  }
  
  @IBAction func clickBackToItemList(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
