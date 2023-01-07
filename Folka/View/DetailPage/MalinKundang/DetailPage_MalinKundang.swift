//
//  DetailPage_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 13/11/22.
//

import UIKit
import AVFoundation
import SpriteKit

class DetailPage_MalinKundang: UIViewController {
  
  @IBOutlet weak var lblOriginStory: UILabel!
  @IBOutlet weak var lblStory: UILabel!
  @IBOutlet weak var coverMalin: UIImageView!
  @IBOutlet weak var buttonBack: UIImageView!
  @IBOutlet weak var buttonStartReading: UIButton!
  var customButtonBack: UIImage!
  var customButtonStartReading: UIImage!
  var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tapNext = UITapGestureRecognizer(target: self, action: #selector(self.previousPage))
    buttonBack.addGestureRecognizer(tapNext)
    buttonBack.isUserInteractionEnabled = true
    addBackground()
    lblStory.text = "Malin Kundang hidup hanya berdua dengan ibunya, Mande Rubayah. Suatu hari ia memutuskan untuk pergi berlayar dan mencari uang. Setelah menjadi orang kaya ia kembali namun tidak mengakui ibunya."
    coverMalin.layer.cornerRadius = 20
    
    buttonStartReading.setTitle("", for: .normal)
    customButtonStartReading = UIImage(named: "buttonStartReading")
    buttonStartReading.setImage(customButtonStartReading?.withRenderingMode(.alwaysOriginal), for: .normal)
  }
  
  func addBackground() {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "backgroudBookDetail")
    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
    self.view.addSubview(imageViewBackground)
    self.view.sendSubviewToBack(imageViewBackground)
  }
  
  @IBAction func nextPage(_ sender: UIButton) {
    Sound.sharedInstance.stopBacksound()
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    
    let nextMainController = MalinKundang_ViewController()
    present(nextMainController, animated: true, completion: nil)
  }
  
  @IBAction func buttonBack(_ sender: UIButton) {
    sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
      
    })
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc func previousPage(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }
}
