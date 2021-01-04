//
//  ItemService.swift
//  Final-Workshop
//
//  Created by Yuehuan Lu on 2021/1/4.
//

import Foundation

class QueryService {
  let defaultSession = URLSession(configuration: .default)
  
  var dataTask: URLSessionDataTask?
  
  typealias JSONDictionary = [String: Any]
  typealias QueryResult = ([Item]?, String) -> Void
  
  func getSearchResults(completion: @escaping QueryResult) {
    
    dataTask?.cancel()
    
    if let urlComponents = URLComponents(string: "https://tw-mobile-xian.github.io/pos-api/items.json") {
      guard let url = urlComponents.url else {
        return
      }
      dataTask =
        defaultSession.dataTask(with: url) { [weak self] data, response, error in
          defer {
            self?.dataTask = nil
          }
          var errorMessage = ""
          var tweetDatas: [Item] = []
          if let error = error {
            errorMessage += "DataTask error: " +
              error.localizedDescription + "\n"
          } else if
            let tweet = data,
            let response = response as? HTTPURLResponse,
            response.statusCode == 200 {
            do {
              tweetDatas = try JSONDecoder().decode([Item].self, from: tweet)
            } catch {
              print(error)
            }
          }
          DispatchQueue.main.async {
            completion(tweetDatas, errorMessage )
          }
        }
      dataTask?.resume()
    }
  }
}

