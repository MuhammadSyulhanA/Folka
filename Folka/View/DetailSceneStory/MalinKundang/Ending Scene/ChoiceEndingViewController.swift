//
//  ChoiceEndingViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//

import UIKit

class ChoiceEndingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      assignbackground()
    }

  func assignbackground(){
    let background = UIImage(named: "backgroudBookDetail")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }

}
