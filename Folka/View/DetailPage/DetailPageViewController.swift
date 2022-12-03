//
//  DetailPage_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 13/11/22.
//

import UIKit

class DetailPageViewController: UIViewController {
  
  @IBOutlet weak var lblCeritaAsal: UILabel!
  @IBOutlet weak var buttonBack: UIButton!
  @IBOutlet weak var lblStory: UILabel!
  @IBOutlet weak var buttonMulaiBaca: UIButton!
  @IBOutlet weak var coverMalin: UIImageView!

  var customButtonBack: UIImage!
  var customButtonMulaiBaca: UIImage!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    assignbackground()
    lblStory.text = "Malin Kundang hidup hanya berdua dengan ibunya, Mande Rubayah. Suatu hari ia memutuskan untuk pergi berlayar dan mencari uang. Setelah menjadi orang kaya ia kembali namun tidak mengakui ibunya."
    coverMalin.layer.cornerRadius = 20
    buttonBack.setTitle("", for: .normal)
    customButtonBack = UIImage(named: "buttonBack")
    buttonBack.setImage(customButtonBack?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonMulaiBaca.setTitle("", for: .normal)
    customButtonMulaiBaca = UIImage(named: "buttonMulaiBaca")
    buttonMulaiBaca.setImage(customButtonMulaiBaca?.withRenderingMode(.alwaysOriginal), for: .normal)
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroudBookDetail")
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleToFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @IBAction func nextPage(_ sender: UIButton) {
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
      let nextMainController = ScenePilihGame_ViewController()
      present(nextMainController, animated: true, completion: nil)
  }
    
  @IBAction func buttonBack(_ sender: UIButton) {
    //    _ = navigationController?.popViewController(animated: true)
    //    self.dismiss(animated: true, completion: nil)
        sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
          sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)

        })
        self.presentingViewController?.dismiss(animated: true, completion: nil)
      }
  }
