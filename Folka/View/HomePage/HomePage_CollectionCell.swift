//
//  HomePageCollectionViewCell.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//

import UIKit

class HomePage_CollectionCell: UICollectionViewCell {
  @IBOutlet weak var titleCerita: UILabel!
  @IBOutlet weak var image: UIImageView!
  static let identifier = "HomePage_CollectionCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell(HomePage: HomePage){
    self.image.image = UIImage(named: HomePage.imageCover)
    self.titleCerita.text = HomePage.title
    image.layer.cornerRadius = 8
  }
}
