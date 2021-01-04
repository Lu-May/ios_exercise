//
//  NavigationController.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import UIKit

class NavigationViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  let queryService = QueryService()
  var item: [Item] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 50
    queryService.getSearchResults() { [weak self] items, _ in
      self?.item = items!
      self?.tableView.reloadData()
    }
  }
  
  @IBAction func clickOneButton(_ sender: Any) {
    let oneViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ItemListViewController")
    self.navigationController?.pushViewController(oneViewController, animated: true)
  }
  
  @IBAction func clicktwoButton(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}

extension NavigationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return item.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
      return UITableViewCell()
    }
    cell.configure(with: item[indexPath.row])
    
    return cell
  }
}

extension NavigationViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let alert = UIAlertController(title: "\(item[indexPath.row].name)", message: "\(item[indexPath.row].barcode)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
    }))
    self.present(alert, animated: true, completion: nil)
  }
}


