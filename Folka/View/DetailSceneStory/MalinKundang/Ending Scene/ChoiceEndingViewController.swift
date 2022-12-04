//
//  ChoiceEndingViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//

import UIKit
import SpriteKit
import AVFoundation

class ChoiceEndingViewController: UIViewController {
  @IBOutlet weak var buttonBack: UIImageView!
  @IBOutlet weak var buttonMenyambut: UIImageView!
  @IBOutlet weak var buttonMintaMaaf: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tapPrevious = UITapGestureRecognizer(target: self, action: #selector(self.previousPage))
    buttonBack.addGestureRecognizer(tapPrevious)
    buttonBack.isUserInteractionEnabled = true
    
    let tapMenyambut = UITapGestureRecognizer(target: self, action: #selector(self.nextPageMenyambut))
    buttonMenyambut.addGestureRecognizer(tapMenyambut)
    buttonMenyambut.isUserInteractionEnabled = true
    
    let tapMintaMaaf = UITapGestureRecognizer(target: self, action: #selector(self.nextPageMintaMaaf))
    buttonMintaMaaf.addGestureRecognizer(tapMintaMaaf)
    buttonMintaMaaf.isUserInteractionEnabled = true
    
    assignbackground()
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroudBookDetail")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @objc func nextPageMintaMaaf(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    
    view = SKView(frame: view.bounds)
    
    if let view = self.view as! SKView? {
      let scene = MalinKundang_AlternateScene17(size: CGSize(width: 2048, height: 1536))
      scene.scaleMode = .aspectFill
      view.presentScene(scene)
      view.showsPhysics = false
      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsNodeCount = true
    }
  }
  
  @objc func nextPageMenyambut(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
    })
    
    view = SKView(frame: view.bounds)
    
    if let view = self.view as! SKView? {
      let scene = MalinKundang_AlternateScene15(size: CGSize(width: 2048, height: 1536))
      scene.scaleMode = .aspectFill
      view.presentScene(scene)
      view.showsPhysics = false
      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsNodeCount = true
    }
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
