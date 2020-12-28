//
//  Data.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import Foundation

struct Data {
  let name: String
  let phone: String
}


let queryService = QueryService()

let datas = queryService.getSearchResults
//let datas = [
//    Data(name: "Alan", phone: "88113201"),
//    Data(name: "Bob", phone: "88113202"),
//    Data(name: "Davies", phone: "88113203"),
//    Data(name: "Smith", phone: "88113204"),
//    Data(name: "Jones", phone: "88113205"),
//    Data(name: "Williams", phone: "88113206"),
//    Data(name: "Taylor", phone: "88113207"),
//    Data(name: "Brown", phone: "88113208"),
//    Data(name: "Evans", phone: "88113209"),
//    Data(name: "Wilson", phone: "88113210"),
//    Data(name: "Thomas", phone: "88113211"),
//    Data(name: "Johnson", phone: "88113212"),
//    Data(name: "Lucas", phone: "88113213"),
//    Data(name: "Alexis", phone: "88113214"),
//    Data(name: "Lisa", phone: "88113215"),
//    Data(name: "Robert", phone: "88113216"),
//    Data(name: "Nancy", phone: "88113217"),
//]
