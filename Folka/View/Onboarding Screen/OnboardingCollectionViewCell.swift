//
//  OnboardingCollectionViewCell.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 02/12/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var descriptionText: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  static let identifier = "OnboardingCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
//    separatorInset = .zero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = .zero
    
  }
  
  func configureCell(page: Page){
    titleLabel.text = page.title
    descriptionText.text = page.description
    imageView.image = UIImage(named: page.image)
  }
}
