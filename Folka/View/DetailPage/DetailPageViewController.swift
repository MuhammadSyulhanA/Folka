//
//  DetailPage_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 13/11/22.
//

import UIKit
import AVFoundation
import SpriteKit

class DetailPageViewController: UIViewController {
    
    @IBOutlet weak var lblCeritaAsal: UILabel!
    
    @IBOutlet weak var buttonBack: UIImageView!
    @IBOutlet weak var lblStory: UILabel!
    @IBOutlet weak var buttonMulaiBaca: UIButton!
    @IBOutlet weak var coverMalin: UIImageView!
    
    var customButtonBack: UIImage!
    var customButtonMulaiBaca: UIImage!
    
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(stateSound)
        
        let tapNext = UITapGestureRecognizer(target: self, action: #selector(self.previousPage))
        buttonBack.addGestureRecognizer(tapNext)
        buttonBack.isUserInteractionEnabled = true
        
        addBackground()
        lblStory.text = "Malin Kundang hidup hanya berdua dengan ibunya, Mande Rubayah. Suatu hari ia memutuskan untuk pergi berlayar dan mencari uang. Setelah menjadi orang kaya ia kembali namun tidak mengakui ibunya."
        coverMalin.layer.cornerRadius = 20
        
        buttonMulaiBaca.setTitle("", for: .normal)
        customButtonMulaiBaca = UIImage(named: "buttonMulaiBaca")
        buttonMulaiBaca.setImage(customButtonMulaiBaca?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    func addBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "backgroudBookDetail")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
        sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
        view = SKView(frame: view.bounds)
        
        if let view = self.view as! SKView? {
          let scene = MalinKundang_Scene1(size: CGSize(width: 2048, height: 1536))
          scene.scaleMode = .aspectFill
          view.presentScene(scene)
          view.showsPhysics = false
          view.ignoresSiblingOrder = true
          view.showsFPS = true
          view.showsNodeCount = true
        }
        
//        let nextMainController = ScenePilihGame_ViewController()
//        present(nextMainController, animated: true, completion: nil)
    }
    
    //  @IBAction func buttonBack(_ sender: UIButton) {
    //    //    _ = navigationController?.popViewController(animated: true)
    //    //    self.dismiss(animated: true, completion: nil)
    //        sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    //        UIView.animate(withDuration: 0.5, animations: { () -> Void in
    //          sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    //
    //        })
    //        self.presentingViewController?.dismiss(animated: true, completion: nil)
    //      }
    
    @objc func previousPage(sender: UITapGestureRecognizer){
        Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
        sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
