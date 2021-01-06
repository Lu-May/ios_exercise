//
//  ItemListViewController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class CartPageViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var purchasedItems: [PurchasedItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "购物车"
    tableView.dataSource = self
  }
  
  func configure(with purchasedItems: [PurchasedItem], promotion: [String]) {
    self.purchasedItems = purchasedItems.filterDuplicates({$0.item.name})
  }
  
  @IBAction func clickForwardToReceiptPage(_ sender: Any) {
    let cartPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ReceiptViewController")
    show(cartPageViewController, sender: self)
  }
}

extension CartPageViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.purchasedItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell else {
      return UITableViewCell()
    }
    
    cell.configure(with: purchasedItems[indexPath.row])
    return cell
  }
}

extension Array {
  func filterDuplicates<PurchasedItem: Equatable>(_ filter: (Element) -> PurchasedItem) -> [Element] {
    var result = [Element]()
    for value in self {
      let key = filter(value)
      if !result.map({filter($0)}).contains(key) {
        result.append(value)
      }
    }
    return result
  }
}
