//
//  LauchScreenViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 05/12/22.
//

import UIKit

class LauchScreenViewController: UIViewController {
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addBackground()
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
          self.navigationController?.pushViewController(OnboardingViewController(), animated: false)
      }
        // Do any additional setup after loading the view.
    }


}
extension UIView {
func addBackground() {
    // screen width and height:
  let width = UIScreen.main.bounds.size.width
  let height = UIScreen.main.bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "splashScreen")

    // you can change the content mode:
  imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}}
