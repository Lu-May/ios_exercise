//
//  ViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//
import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func clickButton(_ sender: Any) {
    let itemListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationViewController")
    show(itemListViewController, sender: self)
  }
}
