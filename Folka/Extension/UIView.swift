//
//  UIView.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/01/23.
//

import UIKit

extension UIView {
  func addBackground() {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "splashScreen")
    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
  }
}
