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
  var item: [Item] = []
  var purchaseditem: [String: Int] = [:]
  var promotion: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
//    tableView.delegate = self
    self.title = "商品列表"
    itemQueryService.getSearchResults() { [weak self] items, _ in
      self?.item = items!
      self?.tableView.reloadData()
    }
    promotionQueryService.getSearchResults() { [weak self] data, _ in
      self?.promotion = data!
      self?.tableView.reloadData()
    }
  }
  
  @IBAction func clickOneButton(_ sender: Any) {
    let oneViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartPageViewController")
    self.navigationController?.pushViewController(oneViewController, animated: true)
  }
  
  @IBAction func clicktwoButton(_ sender: Any) {
    let oneViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ReceiptViewController")
    self.navigationController?.pushViewController(oneViewController, animated: true)
//    self.navigationController?.popViewController(animated: true)
  }
}

extension ItemListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return item.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
      return UITableViewCell()
    }
    
    let addItem = { value in
      self.purchaseditem[self.item[indexPath.row].barcode] = value
    }
    cell.configure(with: item[indexPath.row], promotion: promotion, addItem: addItem)

    return cell
  }
}


