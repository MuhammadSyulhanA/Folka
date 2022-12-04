//
//  ScenePilihGame_ViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 29/11/22.
//

import UIKit
import SpriteKit
import AVFoundation

class ScenePilihGame_ViewController: UIViewController {
  
  var state = 0
  @IBOutlet weak var backgroundKapalDua: UIImageView!
  @IBOutlet weak var objectKapalDua: UIImageView!
  @IBOutlet weak var objectKapalSatu: UIImageView!
  @IBOutlet weak var backgroundKapalSatu: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    assignbackground()
    
    let tapPilihKapalSatu = UITapGestureRecognizer(target: self, action: #selector(self.tapPilihKapalSatu))
    tapPilihKapalSatu.name = "tapSatu"
    backgroundKapalSatu.isUserInteractionEnabled = true
    backgroundKapalSatu.image = UIImage(named: "backgroundKayu")
    backgroundKapalSatu.addGestureRecognizer(tapPilihKapalSatu)
    objectKapalSatu.addGestureRecognizer(tapPilihKapalSatu)
    objectKapalSatu.isUserInteractionEnabled = true
    
    let tapPilihKapalDua = UITapGestureRecognizer(target: self, action: #selector(self.tapPilihKapalDua))
    tapPilihKapalDua.name = "tapDua"
    backgroundKapalDua.isUserInteractionEnabled = true
    backgroundKapalDua.image = UIImage(named: "backgroundKayu")
    backgroundKapalDua.addGestureRecognizer(tapPilihKapalDua)
    objectKapalDua.addGestureRecognizer(tapPilihKapalDua)
    objectKapalDua.isUserInteractionEnabled = true
    
  }
  
  @objc func tapPilihKapalSatu(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    print("Pilih kapal satu")
    state = 1
    backgroundKapalSatu.image = UIImage(named: "backgroundKayuMilih")
    backgroundKapalDua.image = UIImage(named: "backgroundKayu")
  }
  
  @objc func tapPilihKapalDua(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    print("Pilih kapal dua")
    state = 2
    backgroundKapalSatu.image = UIImage(named: "backgroundKayu")
    backgroundKapalDua.image = UIImage(named: "backgroundKayuMilih")
  }
  
  
  func assignbackground(){
    let background = UIImage(named: "backgroundPuzzle")
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleToFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @IBAction func buttonMulai(_ sender: UIButton) {
    if (state == 1){
      view = SKView(frame: view.bounds)
      if let view = self.view as! SKView? {
        let scene = MalinKundang_Puzzle2(size: CGSize(width: 2048, height: 1536))
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        view.showsPhysics = false
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
        sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
          sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
      }
    } else if (state == 2){
      view = SKView(frame: view.bounds)
      if let view = self.view as! SKView? {
        let scene = MalinKundang_Puzzle(size: CGSize(width: 2048, height: 1536))
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        view.showsPhysics = false
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
        sender.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
          sender.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
      }
    }
  }
}
