//
//  ItemViewModelTest.swift
//  Final-WorkshopTests
//
//  Created by Yuehuan Lu on 2021/1/10.
//

import Quick
import Nimble
@testable import Final_Workshop

class MockItemQueryService: ItemQueryService {
  override func getSearchResults(completion: @escaping ItemQueryService.ItemQueryResult) {
    let tweetDatas = [Item(barcode: "123", name: "cat", unit: "unit", price: 5)]
    completion(tweetDatas, "error")
  }
}

class MockPromotionQueryService: PromotionQueryService {
  override func getSearchResults(completion: @escaping PromotionQueryService.PromotionQueryResult) {
    let promotions = ["one", "two"]
    completion(promotions, "error")
  }
}

class ItemViewModelTest: QuickSpec {
  let viewModel = ItemViewModel()
  
  override func spec() {
    describe("test clearPurchaseedItems") {
      viewModel.purchasedItems = [PurchasedItem(
        count: 3,
        promotion: true,
        item: Item(barcode: "12345678", name: "cat", unit: "one", price: 30)
      )]
      it("should be cleared") {
        expect(self.viewModel.purchasedItems.count) == 1
        self.viewModel.clearPurchaseedItems()
        expect(self.viewModel.purchasedItems) == []
        expect(self.viewModel.clearAfterReceipt) == true
        expect(self.viewModel.purchasedItems.count == 0) == true
      }
    }
    
    describe("test getItems") {
      it("should get items list") {
        self.viewModel.itemQueryService = MockItemQueryService()
        self.viewModel.getItems() {
          expect(self.viewModel.items.count) == 1
          expect(self.viewModel.items[0].barcode) == "123"
          expect(self.viewModel.items[0].name) == "cat"
          expect(self.viewModel.items[0].unit) == "unit"
          expect(self.viewModel.items[0].price) == 5
        }
      }
    }
    
    describe("test getpromotions") {
      it("should get promotions") {
        self.viewModel.promotionQueryService = MockPromotionQueryService()
        self.viewModel.getPromotions() {
          expect(self.viewModel.promotions) == ["one", "two"]
        }
      }
    }
  }
}
