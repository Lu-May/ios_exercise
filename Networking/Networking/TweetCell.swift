//
//  DataCell.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import UIKit
class TweetCell: UITableViewCell {
  @IBOutlet weak var sender: UILabel!
  @IBOutlet weak var content: UILabel!
  
  func configure(with tweet: Tweet) {
    sender.font = UIFont.systemFont(ofSize: 25)
    sender.text = tweet.sender?.nick
    content.text = tweet.content
//    if tweet.content == nil {
//      sender.numberOfLines = 2
//      sender.text = "\n\(String(describing: tweet.sender?.nick ?? ""))"
//    }
  }
}
