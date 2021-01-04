//
//  NavigationController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class NavigationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func clickOneButton(_ sender: Any) {
    let oneViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ItemListViewController")
    self.navigationController?.pushViewController(oneViewController, animated: true)
  }
  
  @IBAction func clicktwoButton(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}
