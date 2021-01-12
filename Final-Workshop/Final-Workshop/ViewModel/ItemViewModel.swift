//
//  ItemListViewModel.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/7.
//

import Foundation

class ItemViewModel {
  var itemQueryService = ItemQueryService()
  var promotionQueryService = PromotionQueryService()
  var clearAfterReceipt = false
  var items: [Item] = []
  var purchasedItems: [PurchasedItem] = []
  var promotions: [String] = []
  
  func setclearAfterReceiptFalse() {
    clearAfterReceipt = false
  }
  
  func clearPurchaseedItems() {
    purchasedItems = []
    clearAfterReceipt = true
  }
  
  func getItems(completion: @escaping () -> Void) {
    itemQueryService.getSearchResults() { items, _  in
      self.items = items ?? []
      completion()
    }
  }
  
  func getPromotions(completion: @escaping () -> Void) {
    promotionQueryService.getSearchResults() { promotions, _ in
      self.promotions = promotions ?? []
      completion()
    }
  }
  
  func addPurchasedItem(_ count: Int, cellForRowAt indexPath: IndexPath) {
    purchasedItems.append(contentsOf: [PurchasedItem(
      count: count,
      promotion: promotions.contains(self.items[indexPath.row].barcode),
      item: items[indexPath.row]
    )])
    purchasedItems.sort(by: {$0.count > $1.count})
    purchasedItems = purchasedItems.filterDuplicates({$0.item.name})
  }
  
  func receiptPrint() -> String {
    var totalPrice: Float = 0
    var totalPriceWithoutPromotion: Float = 0
    var receipt: String = ""
    var receiptLableText = ""
    for purchasedItem in purchasedItems {
      totalPrice += purchasedItem.subtotal
      totalPriceWithoutPromotion += Float(purchasedItem.count) * purchasedItem.item.price
      receipt += purchasedItem.subreceipt
    }
    
    receiptLableText = """
                        ***Receipts***
                        \(receipt)----------------------
                        总计：¥\(format(totalPrice))
                        节省：¥\(format(totalPriceWithoutPromotion - totalPrice))
                        **********************
                        """
    return receiptLableText
  }
  
  func format(_ variable: Float) -> String {
    return String(format: "%0.2f",variable);
  }
}

extension Array {
  func filterDuplicates<PurchasedItem: Equatable>(_ filter: (Element) -> PurchasedItem) -> [Element] {
    var result = [Element]()
    for value in self {
      let key = filter(value)
      if !result.map({filter($0)}).contains(key) {
        result.append(value)
      }
    }
    return result
  }
}
