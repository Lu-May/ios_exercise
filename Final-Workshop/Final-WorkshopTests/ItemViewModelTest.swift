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
    let tweetDatas = [Item(barcode: "123", name: "cat", unit: "只", price: 5)]
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
      it("should be cleared") { [self] in
        expect(viewModel.purchasedItems.count) == 1
        viewModel.clearPurchaseedItems()
        expect(viewModel.purchasedItems) == []
        expect(viewModel.clearAfterReceipt) == true
        expect(viewModel.purchasedItems.count == 0) == true
      }
    }
    
    describe("test getItems") {
      it("should get items list") { [self] in
        viewModel.itemQueryService = MockItemQueryService()
        viewModel.getItems() {
          expect(viewModel.items.count) == 1
          expect(viewModel.items[0].barcode) == "123"
          expect(viewModel.items[0].name) == "cat"
          expect(viewModel.items[0].unit) == "只"
          expect(viewModel.items[0].price) == 5
        }
      }
    }
    
    describe("test getpromotions") {
      it("should get promotions") { [self] in
        viewModel.promotionQueryService = MockPromotionQueryService()
        viewModel.getPromotions() {
          expect(viewModel.promotions.count) == 2
          expect(viewModel.promotions) == ["one", "two"]
        }
      }
    }
    
    describe("test addPurchasedItem") {
      it("should get promotions") { [self] in
        viewModel.addPurchasedItem(6, cellForRowAt: [0, 0])
        expect(viewModel.purchasedItems[0].count) == 6
        expect(viewModel.purchasedItems[0].promotion) == false
        expect(viewModel.purchasedItems[0].item.barcode) == "123"
      }
    }
    
    describe("test receiptPrint") {
      it("should print receipt") { [self] in
        expect(viewModel.receiptPrint()) ==
          """
***Receipts***
名称：cat，数量：6只，单价：¥5.0
小计：¥30.00
----------------------
总计：¥30.00
节省：¥0.00
**********************
"""
      }
    }
    
    describe("test format") {
      it("should return 0 if parameter has more than two zero or no zero after point") { [self] in
        expect(viewModel.format(0.0000)) == "0.00"
        expect(viewModel.format(0)) == "0.00"
      }
      
      it("should return two digits when paremeter is a int number") { [self] in
        expect(viewModel.format(3)) == "3.00"
        expect(viewModel.format(49)) == "49.00"
      }
      
      it("should return two digits when parameter has one digit") { [self] in
        expect(viewModel.format(12.2)) == "12.20"
        expect(viewModel.format(23.8)) == "23.80"
      }
      
      it("should return two digits when parameter has more than two digits") { [self] in
        expect(viewModel.format(12.322)) == "12.32"
        expect(viewModel.format(12.328)) == "12.33"
      }
    }
  }
}
