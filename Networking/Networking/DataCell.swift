//
//  DataCell.swift
//  Networking
//
//  Created by Yuehuan Lu on 2020/12/25.
//

import UIKit
class DataCell: UITableViewCell {
    @IBOutlet weak var lable: UILabel!
    
    func configure(with data: Data) {
      lable.text = data.name
    }
}
