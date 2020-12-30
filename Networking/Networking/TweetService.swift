//
//  QueryService.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/28.
//

import Foundation

class QueryService {
  let defaultSession = URLSession(configuration: .default)
  
  var dataTask: URLSessionDataTask?
  
  typealias JSONDictionary = [String: Any]
  typealias QueryResult = ([Tweet]?, String) -> Void
  
  func getSearchResults(completion: @escaping QueryResult) {
    
    dataTask?.cancel()
    
    if let urlComponents = URLComponents(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets") {
      guard let url = urlComponents.url else {
        return
      }
      dataTask =
        defaultSession.dataTask(with: url) { [weak self] data, response, error in
          defer {
            self?.dataTask = nil
          }
          var errorMessage = ""
          var tweetDatas: [Tweet] = []
          if let error = error {
            errorMessage += "DataTask error: " +
              error.localizedDescription + "\n"
          } else if
            let tweet = data,
            let response = response as? HTTPURLResponse,
            response.statusCode == 200 {
            do {
              tweetDatas = try JSONDecoder().decode([Tweet].self, from: tweet)
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
