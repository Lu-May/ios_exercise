//
//  ItemListViewModel.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/7.
//

import Foundation

class ItemListViewModel {
  let itemQueryService = ItemQueryService()
  let promotionQueryService = PromotionQueryService()
  var items: [Item] = []
  var purchasedItems: [PurchasedItem] = []
  var promotions: [String] = []
  
  func getItems(completion: @escaping () -> Void) {
    itemQueryService.getSearchResults() { items, _  in
      self.items = items ?? []
      completion()
    }
  }
  
  func getPromotions(completion: @escaping () -> Void) {
    promotionQueryService.getSearchResults() { promotions, _ in
      self.promotions = promotions ?? []
    }
  }
  
  func addPurchasedItem(_ count: Int, cellForRowAt indexPath: IndexPath) {
    self.purchasedItems.append(contentsOf: [PurchasedItem(
      count: count,
      promotion: self.promotions.contains(self.items[indexPath.row].barcode),
      item: self.items[indexPath.row]
    )])
    self.purchasedItems.sort(by: {$0.count > $1.count})
  }
}
