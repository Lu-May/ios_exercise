//
//  NavigationController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ItemListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let itemQueryService = ItemQueryService()
  let promotionQueryService = PromotionQueryService()
  var items: [Item] = []
  var purchasedItems: [PurchasedItem] = []
  var promotions: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    //    tableView.delegate = self
    self.title = "商品列表"
    itemQueryService.getSearchResults() { [weak self] items, _ in
      self?.items = items!
      self?.tableView.reloadData()
    }
    promotionQueryService.getSearchResults() { [weak self] data, _ in
      self?.promotions = data!
      self?.tableView.reloadData()
    }
  }
  
  @IBAction func clickOneButton(_ sender: Any) {
    let cartPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartPageViewController") as CartPageViewController
    cartPageViewController.configure(with: self.purchasedItems)
    self.navigationController?.pushViewController(cartPageViewController, animated: true)
  }
}

extension ItemListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
      return UITableViewCell()
    }
    
    cell.configure(with: items[indexPath.row], promotion: promotions) { [weak self] count in
      self?.purchasedItems.append(contentsOf: [PurchasedItem(
        count: count,
        promotion: self!.promotions.contains(self!.items[indexPath.row].barcode),
        item: self!.items[indexPath.row]
      )])
      self?.purchasedItems.sort(by: {$0.count > $1.count})
    }
    return cell
  }
}


