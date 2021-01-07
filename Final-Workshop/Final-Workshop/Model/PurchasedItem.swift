//
//  PurchasedItem.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/5.
//

import Foundation

struct PurchasedItem: Equatable {
  static func == (lhs: PurchasedItem, rhs: PurchasedItem) -> Bool {
    return true
  }
  
  var count: Int
  var promotion: Bool
  var subtotal: Float {
    if promotion {
      if count >= 3 {
        return Float((count/3)*2 + count%3) * item.price
      }
    }
    return Float(count) * item.price
  }
  var item: Item
}
