//
//  PageDetailViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 04/12/22.
//

import UIKit

class PageDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      assignbackground()
        // Do any additional setup after loading the view.
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
