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
    customButton = UIImage(named: "buttonProfile")
    buttonSelesai.setImage(customButton?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    assignbackground()
    textField.delegate = self
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroundProfile")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  
  @IBAction func buttonSelesai(_ sender: UIButton) {
    UserDefaults.standard.set(textField.text!, forKey: "name")
    
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    
    let controller = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
//    let controller2 = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
//    controller.text = textField.text
//    controller2.text = textField.text
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
  }
}



