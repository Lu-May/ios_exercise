//
//  DataController.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import UIKit
class DataViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  let queryService = QueryService()
  var tweet: [Tweet] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.rowHeight = 70
    queryService.getSearchResults() { [weak self] tweets, _ in
      self?.tweet = tweets!
      self?.tableView.reloadData()
    }
  }
}


extension DataViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweet.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as? TweetCell else {
      return UITableViewCell()
    }
    
    cell.configure(with: tweet[indexPath.row])
    return cell
  }
}
