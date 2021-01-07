//
//  ItemListViewModel.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/7.
//

import Foundation

class ItemViewModel {
  let itemQueryService = ItemQueryService()
  let promotionQueryService = PromotionQueryService()
  var clearAfterReceipt = false
  var items: [Item] = []
  var purchasedItems: [PurchasedItem] = []
  var promotions: [String] = []
  
  func setclearAfterReceiptTrue() {
    self.clearAfterReceipt = true
  }
  
  func setclearAfterReceiptFalse() {
    self.clearAfterReceipt = false
  }
  
  func clearPurchaseedItems() {
    self.purchasedItems = []
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
  
  func receiptPrint() -> String {
    var totalPrice: Float = 0
    var totalPriceWithoutPromotion: Float = 0
    var receipt: String = ""
    var receiptLableText = ""
    for item in self.purchasedItems {
      totalPrice += item.subtotal
      totalPriceWithoutPromotion += Float(item.count) * item.item.price
      receipt += "名称：\(item.item.name)，数量：\(item.count)\(item.item.unit)，单价：¥\(item.item.price)\n小计：¥\(format(item.subtotal))\n";
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
