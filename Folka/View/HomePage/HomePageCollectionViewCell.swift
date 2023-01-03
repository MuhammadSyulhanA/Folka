//
//  HomePageCollectionViewCell.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleCerita: UILabel!
  @IBOutlet weak var image: UIImageView!
  static let identifier = "HomePageCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell(HomePage: HomePage){
    self.image.image = UIImage(named: HomePage.imageCover)
    self.titleCerita.text = HomePage.title
    image.layer.cornerRadius = 8
  }
}
