//
//  ProfileOnboard_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 12/11/22.
//

import UIKit

class ProfileOnboard_ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var buttonSelesai: UIButton!
  @IBOutlet weak var textField: UITextField!
  var customButton: UIImage!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buttonSelesai.setTitle("", for: .normal)
    customButton = UIImage(named: "ButtonProfile")
    buttonSelesai.setImage(customButton?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    assignbackground()
    textField.delegate = self
  }
  
  func assignbackground(){
    let background = UIImage(named: "BackgroundProfile")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @IBAction func buttonSelesai(_ sender: Any) {
    UserDefaults.standard.set(textField.text!, forKey: "name")
    let controller = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
    controller.text = textField.text
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
  }
}



