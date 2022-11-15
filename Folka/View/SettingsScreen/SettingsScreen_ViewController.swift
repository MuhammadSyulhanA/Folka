//
//  SettingsScreen_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 15/11/22.
//

import UIKit

class SettingsScreen_ViewController: UIViewController {
  
  @IBOutlet weak var buttonUbahNama: UIButton!
  @IBOutlet weak var buttonBack: UIButton!
  @IBOutlet weak var buttonMusic: UIButton!
  @IBOutlet weak var buttonSound: UIButton!
  
  var customButtonBack:UIImage!
  var customButtonUbahNama:UIImage!
  var customButtonSound: UIImage!
  var customButtonMusic: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assignbackground()
    
    buttonBack.setTitle("", for: .normal)
    customButtonBack = UIImage(named: "ButtonBack")
    buttonBack.setImage(customButtonBack?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonUbahNama.setTitle("", for: .normal)
    customButtonUbahNama = UIImage(named: "ButtonUbahNama")
    buttonUbahNama.setImage(customButtonUbahNama?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonSound.setTitle("", for: .normal)
    customButtonSound = UIImage(named: "ButtonOnSound")
    buttonSound.setImage(customButtonSound?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonMusic.setTitle("", for: .normal)
    customButtonMusic = UIImage(named: "ButtonOnMusic")
    buttonMusic.setImage(customButtonMusic?.withRenderingMode(.alwaysOriginal), for: .normal)
  }
  
  func assignbackground(){
    let background = UIImage(named: "BackgroundSettings")
    
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
