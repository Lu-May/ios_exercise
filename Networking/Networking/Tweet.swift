//
//  Data.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import Foundation

struct Sender : Decodable {
  var username: String
  var nick: String
  var avatar: String
}

struct Tweet : Decodable {
  var content: String?
  var sender: Sender?
}
