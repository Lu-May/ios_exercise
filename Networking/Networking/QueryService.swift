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
  
  var errorMessage = ""
  var tracks: [Data] = []

  typealias JSONDictionary = [String: Any]
  typealias QueryResult = ([Data]?, String) -> Void

  func getSearchResults(completion: @escaping QueryResult) {
    
    dataTask?.cancel()
  
    if var urlComponents = URLComponents(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/") {
      urlComponents.query = "jsmith/tweets"
      guard let url = urlComponents.url else {
        return
      }
      dataTask =
        defaultSession.dataTask(with: url) { [weak self] data, response, error in
        defer {
          self?.dataTask = nil
        }
        if let error = error {
          self?.errorMessage += "DataTask error: " +
                                  error.localizedDescription + "\n"
        } else if
          let data = data,
          let response = response as? HTTPURLResponse,
          response.statusCode == 200 {
            print(data)
//          self?.updateSearchResults(data)
            
          DispatchQueue.main.async {
            completion(self?.tracks, self?.errorMessage ?? "")
          }
        }
      }
      dataTask?.resume()
    }
  }
  
  //
  // MARK: - Private Methods
  //
//  private func updateSearchResults(_ data: Data) {
//    var response: JSONDictionary?
//    tracks.removeAll()
//    
//    do {
//      response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
//    } catch let parseError as NSError {
//      errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
//      return
//    }
//    
//    guard let array = response!["results"] as? [Any] else {
//      errorMessage += "Dictionary does not contain results key\n"
//      return
//    }
//    
//    var index = 0
//    
//    for trackDictionary in array {
//      if let trackDictionary = trackDictionary as? JSONDictionary,
//        let previewURLString = trackDictionary["previewUrl"] as? String,
//        let previewURL = URL(string: previewURLString),
//        let name = trackDictionary["trackName"] as? String,
//        let artist = trackDictionary["artistName"] as? String {
//          tracks.append(Data(name: name, artist: artist, previewURL: previewURL, index: index))
//          index += 1
//      } else {
//        errorMessage += "Problem parsing trackDictionary\n"
//      }
//    }
//  }
}
