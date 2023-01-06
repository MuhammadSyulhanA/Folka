//
//  ProfileOnboard_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 12/11/22.
//

import UIKit

class Onboarding_InputName: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var buttonFinish: UIButton!
  @IBOutlet weak var textField: UITextField!
  var customButton: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assignbackground()
    self.setupToHideKeyboardOnTapOnView()
    self.definesPresentationContext = true
    buttonFinish.setTitle("", for: .normal)
    customButton = UIImage(named: "buttonSelesai")
    buttonFinish.setImage(customButton?.withRenderingMode(.alwaysOriginal), for: .normal)
    textField.delegate = self
  }
  
  @IBAction func buttonFinish(_ sender: UIButton) {
    UserDefaults.standard.set(textField.text!, forKey: "name")
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    if textField.text! != "" {
      let controller = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
      controller.modalPresentationStyle = .fullScreen
      present(controller, animated: true, completion: nil)
      self.navigationController?.popViewController(animated: true)
    }
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
}





