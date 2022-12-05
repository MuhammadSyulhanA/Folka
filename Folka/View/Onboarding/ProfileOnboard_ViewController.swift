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
//  var soundURI: URL?
//  var audioPlayer: AVAudioPlayer?

  override func viewDidLoad() {
    super.viewDidLoad()
//    Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
    self.setupToHideKeyboardOnTapOnView()
    self.definesPresentationContext = true
    buttonSelesai.setTitle("", for: .normal)
    customButton = UIImage(named: "buttonSelesai")
    buttonSelesai.setImage(customButton?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    assignbackground()
    textField.delegate = self
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
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    

    let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)
 
    
    
    
  }
}

extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
  
  
}

extension UIApplication {
class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let navigationController = controller as? UINavigationController {
        return topViewController(controller: navigationController.visibleViewController)
    }
    if let tabController = controller as? UITabBarController {
        if let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
    }
    if let presented = controller?.presentedViewController {
        return topViewController(controller: presented)
    }
    return controller
}
}



