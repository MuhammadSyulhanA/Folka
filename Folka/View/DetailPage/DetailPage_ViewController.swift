//
//  DetailPage_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 13/11/22.
//

import UIKit

class DetailPage_ViewController: UIViewController {
  
  @IBOutlet weak var lblStory: UILabel!
  @IBOutlet weak var lblCeritaAsal: UILabel!
  @IBOutlet weak var buttonMulaiBaca: UIButton!
  @IBOutlet weak var coverMalin: UIImageView!
  @IBOutlet weak var buttonBack: UIButton!
  var customButtonBack: UIImage!
  var customButtonMulaiBaca: UIImage!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    assignbackground()
    lblStory.text = "Malin Kundang hidup berdua dengan ibunya, Made Rubayah, sejak kecil. Ia selalu bekerja keras untuk membantu ibunya. Suatu hari ia memutuskan untuk pergi berlayar dan mencari uang. Walau berat, Made Rubayah pun mengizinkan anaknya untuk pergi. Malin kemudian menjadi pengusaha dengan harta yang banyak dan menikah dengan anak saudagar. Saat kembali ke tempat asalnya, Malin tidak mengakui ibunya. Sang ibu kemudian berdoa agar Malin belajar dari kesalahannya."
    coverMalin.layer.cornerRadius = 10
    buttonBack.setTitle("", for: .normal)
    customButtonBack = UIImage(named: "ButtonBack")
    buttonBack.setImage(customButtonBack?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    buttonMulaiBaca.setTitle("", for: .normal)
    customButtonMulaiBaca = UIImage(named: "ButtonMulaiMembaca")
    buttonMulaiBaca.setImage(customButtonMulaiBaca?.withRenderingMode(.alwaysOriginal), for: .normal)
  }
  
  func assignbackground(){
    let background = UIImage(named: "BackgroundDetail")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
    @IBAction func nextPage(_ sender: Any) {
        let nextMainController = MalinKundang_ViewController()
//        self.navigationController?.pushViewController(nextMainController, animated: true)
        present(nextMainController, animated: true, completion: nil)
    }
    
}

