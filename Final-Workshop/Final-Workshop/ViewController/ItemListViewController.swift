//
//  NavigationController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class ItemListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let itemViewModel = ItemListViewModel()
  
//  let itemQueryService = ItemQueryService()
  let promotionQueryService = PromotionQueryService()
//  var items: [Item] = []
  var purchasedItems: [PurchasedItem] = []
  var promotions: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "商品列表"
    tableView.dataSource = self
    
    itemViewModel.getItems() { [weak self] in
      self?.tableView.reloadData()

    }
    
    itemViewModel.getPromotions() { [weak self] in
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
    return itemViewModel.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
      return UITableViewCell()
    }
    
    cell.configure(with: itemViewModel.items[indexPath.row], promotion: promotions) { [weak self] count in
//      self?.itemViewModel.addItem()
      self?.purchasedItems.append(contentsOf: [PurchasedItem(
        count: count,
        promotion: self!.promotions.contains(self!.itemViewModel.items[indexPath.row].barcode),
        item: self!.itemViewModel.items[indexPath.row]
      )])
      self?.purchasedItems.sort(by: {$0.count > $1.count})
    }
    return cell
  }
}

