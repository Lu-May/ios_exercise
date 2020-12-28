//
//  DataController.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import UIKit
class DataViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
      super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension DataViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell else {
      return UITableViewCell()
    }
    
//    cell.configure(with: datas[indexPath.row])
    return cell
  }
}

extension DataViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "\(datas[indexPath.row].name)", message: "\(datas[indexPath.row].phone)", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//             }))
//             self.present(alert, animated: true, completion: nil)
//        }
}

