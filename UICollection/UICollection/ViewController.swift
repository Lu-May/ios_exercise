//
//  ViewController.swift
//  UICollection
//
//  Created by Yuehuan Lu on 2021/1/13.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
  @IBOutlet var collectionView: UICollectionView!
  
  var dataSource = [
    ["name":"1","pic":"p2"],
    ["name":"2","pic":"p2"],
    ["name":"3","pic":"p2"],
    ["name":"3","pic":"p2"],
    ["name":"5","pic":"p2"],
    ["name":"6","pic":"p2"],
    ["name":"7","pic":"p2"],
    ["name":"8","pic":"p2"],
    ["name":"9","pic":"p2"],
    ["name":"10","pic":"p2"],
    ["name":"11","pic":"p2"],
    ["name":"12","pic":"p2"],
    ["name":"13","pic":"p2"],
    ["name":"14","pic":"p2"],
    ["name":"15","pic":"p2"],
    ["name":"16","pic":"p2"],
    ["name":"17","pic":"p2"],
    ["name":"18","pic":"p2"],
    ["name":"19","pic":"p2"],
    ["name":"20","pic":"p2"]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI()
  {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(
      width: (self.view.bounds.size.width - 40) / 2 + 5,
      height: (self.view.bounds.size.width - 40) / 2 + 5
    )
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
    collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
    collectionView.dataSource = self
    collectionView.backgroundColor = UIColor.white
    view.addSubview(collectionView)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
    let data = dataSource[indexPath.row]
    cell.imageView.image = UIImage(named: data["pic"] ?? "");
    return cell
  }
}

