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
    customButtonBack = UIImage(named: "buttonBack")
    buttonBack.setImage(customButtonBack?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonUbahNama.setTitle("", for: .normal)
    customButtonUbahNama = UIImage(named: "buttonUbahNama")
    buttonUbahNama.setImage(customButtonUbahNama?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonSound.setTitle("", for: .normal)
    customButtonSound = UIImage(named: "buttonOnSound")
    buttonSound.setImage(customButtonSound?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonMusic.setTitle("", for: .normal)
    customButtonMusic = UIImage(named: "buttonOnMusic")
    buttonMusic.setImage(customButtonMusic?.withRenderingMode(.alwaysOriginal), for: .normal)
  }
  
  @IBAction func buttonBack(_ sender: UIButton) {
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)

    })
    _ = navigationController?.popViewController(animated: true)
    self.dismiss(animated: true, completion: nil)
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroundSettings")
    
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
