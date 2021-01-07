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
}
