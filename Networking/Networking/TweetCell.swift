//
//  DataCell.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import UIKit
class TweetCell: UITableViewCell {
  @IBOutlet weak var content: UILabel!
  
  func configure(with tweet: Tweet) {
    (tweet.content != nil && tweet.sender?.nick != nil) ?  (content.numberOfLines = 2) :  (content.numberOfLines = 1)
    content.text = "\(String(describing: tweet.sender?.nick ?? ""))\n\(String(describing: tweet.content ?? ""))"
  }
}
