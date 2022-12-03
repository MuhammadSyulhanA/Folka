//
//  SettingsScreen_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 15/11/22.
//

import UIKit

class SettingsScreen_ViewController: UIViewController, UITextFieldDelegate {
  
  var text: String!
  var changeFXSound = true
  var changeFXMusic = true
  
  @IBOutlet weak var buttonBack: UIImageView!
  @IBOutlet weak var buttonUbahNama: UIButton!
//  @IBOutlet weak var buttonBack: UIButton!
  @IBOutlet weak var buttonMusic: UIButton!
  @IBOutlet weak var textFieldChangeName: UITextField!
  @IBOutlet weak var buttonSound: UIButton!
  
  var tag = 0
  var customButtonBack:UIImage!
  var customButtonUbahNama:UIImage!
  var customButtonSound: UIImage!
  var customButtonMusic: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assignbackground()
    
    let tapNext = UITapGestureRecognizer(target: self, action: #selector(self.nextPage))
       buttonBack.addGestureRecognizer(tapNext)
       buttonBack.isUserInteractionEnabled = true
    
    text = UserDefaults.standard.string(forKey: "name")
    textFieldChangeName.text = text
    textFieldChangeName.delegate = self
    textFieldChangeName.font = UIFont.systemFont(ofSize: 25)
    textFieldChangeName.isUserInteractionEnabled = false
    
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
  
  @IBAction func buttonSound(_ sender: UIButton) {
    if changeFXSound{
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
      buttonSound.setTitle("", for: .normal)
      customButtonSound = UIImage(named: "buttonOffSound")
      buttonSound.setImage(customButtonSound?.withRenderingMode(.alwaysOriginal), for: .normal)
      changeFXSound = false
    } else{
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
      buttonSound.setTitle("", for: .normal)
      customButtonSound = UIImage(named: "buttonOnSound")
      buttonSound.setImage(customButtonSound?.withRenderingMode(.alwaysOriginal), for: .normal)
      changeFXSound = true
    }
  }
  
  @IBAction func buttonMusic(_ sender: UIButton) {
    if changeFXMusic{
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
      buttonMusic.setTitle("", for: .normal)
      customButtonMusic = UIImage(named: "buttonOffMusic")
      buttonMusic.setImage(customButtonMusic?.withRenderingMode(.alwaysOriginal), for: .normal)
      changeFXMusic = false
    } else{
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
      buttonMusic.setTitle("", for: .normal)
      customButtonMusic = UIImage(named: "buttonOnMusic")
      buttonMusic.setImage(customButtonMusic?.withRenderingMode(.alwaysOriginal), for: .normal)
      changeFXMusic = true
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  @IBAction func buttonUbahNama(_ sender: UIButton) {
//      textFieldChangeName.isUserInteractionEnabled = is
    if textFieldChangeName.isUserInteractionEnabled {
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
     sender.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
             UIView.animate(withDuration: 0.3, animations: { () -> Void in
               sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
             })
      buttonUbahNama.setTitle("", for: .normal)
      customButtonUbahNama = UIImage(named: "buttonUbahNama")
      buttonUbahNama.setImage(customButtonUbahNama?.withRenderingMode(.alwaysOriginal), for: .normal)
      UserDefaults.standard.set(textFieldChangeName.text!, forKey: "name")
      UserDefaults.standard.synchronize()
      print(UserDefaults.standard.string(forKey: "name")!)
      textFieldChangeName.isUserInteractionEnabled = false
    } else{
      Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
     sender.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
             UIView.animate(withDuration: 0.3, animations: { () -> Void in
               sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
             })
      textFieldChangeName.isUserInteractionEnabled = true
      buttonUbahNama.setTitle("", for: .normal)
      customButtonUbahNama = UIImage(named: "buttonSimpan")
      buttonUbahNama.setImage(customButtonUbahNama?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
  }
  
//  @IBAction func buttonBack(_ sender: UIButton) {
//    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
//    UIView.animate(withDuration: 0.5, animations: { () -> Void in
//      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
//
//    })
//    let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
//    controller.modalPresentationStyle = .fullScreen
//    present(controller, animated: true, completion: nil)
//  }
  
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
  
  
  @objc func nextPage(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
             UIView.animate(withDuration: 0.3, animations: { () -> Void in
               sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
             })
    let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
 }
}
