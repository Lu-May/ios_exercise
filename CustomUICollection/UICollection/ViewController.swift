//
//  ViewController.swift
//  UICollection
//
//  Created by Yuehuan Lu on 2021/1/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource {
  @IBOutlet var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
      layout.delegate = self
    }
    setupUI()
  }
  
  func setupUI()
  {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(
      width: (self.view.bounds.size.width - 40) / 2 + 5,
      height: (self.view.bounds.size.height - 40) / 2 + 5
    )
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
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
    cell.imageView.image = UIImage(named: data.pic);
    return cell
  }
}

extension ViewController: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return (UIImage(named: dataSource[indexPath.row].pic)?.size.height)!
  }
}


