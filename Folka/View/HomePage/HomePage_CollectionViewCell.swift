//
//  HomePage_CollectionViewCell.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 11/11/22.
//

import UIKit

class HomePage_CollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var image: UIImageView!
  
  static let identifier = "HomePage_CollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configureCell(HomePage: HomePage){
    self.image.image = UIImage(named: HomePage.imageCover)
    image.layer.cornerRadius = 8
  }
  
}
