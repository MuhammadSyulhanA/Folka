//
//  MalinKundang_Puzzle.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 18/11/22.
//

import Foundation
import UIKit
import GameplayKit
import SpriteKit

class MalinKundang_Puzzle2: SKScene{
  var scrollView: CustomScrollView!
  let moveableNode = SKNode()
  
//  var scrollGround: UIView!
  
  let background = SKSpriteNode(imageNamed: "BackgroundPuzzle")
  let kayuPuzzle = SKSpriteNode(imageNamed: "KayuPuzzle")
  let buttonHome = SKSpriteNode(imageNamed: "ButtonHome")
  let buttonTanya = SKSpriteNode(imageNamed: "ButtonTanya")
  let outlineKapal = SKSpriteNode(imageNamed: "OutlineKapal2")
  
  //MARK: PUZZLE KECIL
  let puzzleKecilBadanKapalAtas = SKSpriteNode(imageNamed: "PuzzleKecil_BadanKapalAtas")
  let puzzleKecilBadanKapalBawah = SKSpriteNode(imageNamed: "PuzzleKecil_BadanKapalBawah")
  let puzzleKecilBadanKapalBiru = SKSpriteNode(imageNamed: "PuzzleKecil_BadanKapalBiru")
  let puzzleKecilBulatKapal = SKSpriteNode(imageNamed: "PuzzleKecil_BulatKapal")
  let puzzleKecilGarisKapal = SKSpriteNode(imageNamed: "PuzzleKecil_GarisKapal2")
  let puzzleKecilGarisMerahKapal = SKSpriteNode(imageNamed: "PuzzleKecil_GarisMerahKapal")
  let puzzleKecilJendelaBanyakKapal = SKSpriteNode(imageNamed: "PuzzleKecil_JendelaBanyakKapal")
  let puzzleKecilJendelaKapalAtas = SKSpriteNode(imageNamed: "PuzzleKecil_JendelaKapalAtas")
  let puzzleKecilBenderaKapal = SKSpriteNode(imageNamed: "PuzzleKecil_BenderaKapal")
  let puzzleKecilPelampung = SKSpriteNode(imageNamed: "PuzzleBesar_PelampungKapal2")
  
  //MARK: PUZZLE BESAR
  let puzzleBesarBadanKapalAtas = SKSpriteNode(imageNamed: "PuzzleBesar_BadanKapalAtas")
  let puzzleBesarBadanKapalBawah = SKSpriteNode(imageNamed: "PuzzleBesar_BadanKapalBawah")
  let puzzleBesarBadanKapalBiru = SKSpriteNode(imageNamed: "PuzzleBesar_BadanKapalBiru")
  let puzzleBesarBulatKapal = SKSpriteNode(imageNamed: "PuzzleBesar_BulatKapal")
  let puzzleBesarGarisKapal = SKSpriteNode(imageNamed: "PuzzleBesar_GarisKapal2")
  let puzzleBesarGarisMerahKapal = SKSpriteNode(imageNamed: "PuzzleBesar_GarisMerahKapal")
  let puzzleBesarJendelaBanyakKapal = SKSpriteNode(imageNamed: "PuzzleBesar_JendelaBanyakKapal")
  let puzzleBesarJendelaKapalAtas = SKSpriteNode(imageNamed: "PuzzleBesar_JendelaKapalAtas")
  let puzzleBesarBenderaKapal = SKSpriteNode(imageNamed: "PuzzleBesar_BenderaKapal")
  let puzzleBesarPelampung = SKSpriteNode(imageNamed: "PuzzleBesar_PelampungKapal2")
  
  
  override init(size: CGSize){
    super.init(size: size)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  override func didMove(to view: SKView) {
    
    
    var arrayPuzzleKecil: [SKSpriteNode] = [
      puzzleKecilPelampung, puzzleBesarBulatKapal, puzzleKecilBenderaKapal, puzzleKecilGarisKapal, puzzleKecilGarisMerahKapal
    ]
    
    self.backgroundColor = SKColor.white
    
    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanFrom(recognizer:)))
    panGestureRecognizer.maximumNumberOfTouches = 1
    view.addGestureRecognizer(panGestureRecognizer)
    
    //MARK: POSISI PUZZLE KECIL
    background.size = CGSize(width: 2040, height: 1120)
    background.position = CGPoint(x: size.width/2, y: size.height/2)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.zPosition = -1
    addChild(background)
    
    outlineKapal.size = CGSize(width: 1283, height: 719)
    outlineKapal.position = CGPoint(x: size.width/2.308, y: size.height/2.1)
    outlineKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    outlineKapal.zPosition = 2
    addChild(outlineKapal)
    
    buttonHome.size = CGSize(width: 130, height: 130)
    buttonHome.position = CGPoint(x: size.width/16, y: size.height/1.35)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    addChild(buttonHome)
    
    buttonTanya.size = CGSize(width: 120, height: 120)
    buttonTanya.position = CGPoint(x: size.width/16, y: size.height/1.55)
    buttonTanya.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTanya.zPosition = 2
    addChild(buttonTanya)
    
    kayuPuzzle.scale(to: CGSize(width: 750, height: 880))
    kayuPuzzle.position = CGPoint(x: size.width/1.03, y: size.height/2)
    kayuPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kayuPuzzle.zPosition = 2
    addChild(kayuPuzzle)
    
    puzzleKecilBulatKapal.name = "puzzleBulatKapal"
    puzzleKecilBulatKapal.scale(to: CGSize(width: 320, height: 100))
    puzzleKecilBulatKapal.position = CGPoint(x: size.width/1.11, y: size.height/1.4)
    puzzleKecilBulatKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBulatKapal.isHidden = false
    puzzleKecilBulatKapal.zPosition = 3
    //    addChild(puzzleKecilBulatKapal)
    
    puzzleKecilGarisMerahKapal.name = "puzzleKecilGarisMerahKapal"
    puzzleKecilGarisMerahKapal.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilGarisMerahKapal.position = CGPoint(x: size.width/1.1, y: size.height/1.60)
    puzzleKecilGarisMerahKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisMerahKapal.zPosition = 3
    //    addChild(puzzleKecilGarisMerahKapal)
    
    puzzleKecilBenderaKapal.name = "puzzleKecilBenderaKapal"
    puzzleKecilBenderaKapal.scale(to: CGSize(width: 230, height: 90))
    puzzleKecilBenderaKapal.position = CGPoint(x: size.width/1.1, y: size.height/1.85)
    puzzleKecilBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBenderaKapal.zPosition = 3
    //    addChild(puzzleKecilBenderaKapal)
    
    puzzleKecilJendelaKapalAtas.name = "puzzleKecilJendelaKapalAtas"
    puzzleKecilJendelaKapalAtas.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilJendelaKapalAtas.position = CGPoint(x: size.width/1.1, y: size.height/2.15)
    puzzleKecilJendelaKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapalAtas.zPosition = 3
    //    addChild(puzzleKecilJendelaKapalAtas)
    
    puzzleKecilBadanKapalAtas.name = "puzzleKecilBadanKapalAtas"
    puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 230, height: 60))
    puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.1, y: size.height/2.55)
    puzzleKecilBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalAtas.zPosition = 3
    //    addChild(puzzleKecilBadanKapalAtas)
    
    puzzleKecilGarisKapal.name = "puzzleKecilGarisKapal"
    puzzleKecilGarisKapal.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilGarisKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.00)
    puzzleKecilGarisKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKapal.zPosition = 3
    //    addChild(puzzleKecilGarisKapal)
    
    puzzleKecilBadanKapalBiru.name = "puzzleKecilBadanKapalBiru"
    puzzleKecilBadanKapalBiru.scale(to: CGSize(width: 350, height: 70))
    puzzleKecilBadanKapalBiru.position = CGPoint(x: size.width/1.1, y: size.height/3.60)
    puzzleKecilBadanKapalBiru.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalBiru.zPosition = 3
    //    addChild(puzzleKecilBadanKapalBiru)
    
    puzzleKecilPelampung.name = "puzzleKecilPelampung"
    puzzleKecilPelampung.scale(to: CGSize(width: 113, height: 105))
    puzzleKecilPelampung.position = CGPoint(x: size.width/1.1, y: size.height/4)
    puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 1)
    puzzleKecilPelampung.zPosition = 5
    puzzleKecilPelampung.isHidden = false
    //    addChild(puzzleKecilPelampung)
    
    puzzleKecilJendelaBanyakKapal.name = "puzzleKecilJendelaBanyakKapal"
    puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 247, height: 63))
    puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.1, y: size.height/4.5)
    puzzleKecilJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 2.5)
    puzzleKecilJendelaBanyakKapal.zPosition = 3
    //    addChild(puzzleKecilJendelaBanyakKapal)
    
    puzzleKecilBadanKapalBawah.name = "puzzleKecilBadanKapalBawah"
    puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 247, height: 63))
    puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.1, y: size.height/4.7)
    puzzleKecilBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 3.5)
    puzzleKecilBadanKapalBawah.zPosition = 3
    //    addChild(puzzleKecilBadanKapalBawah)
    
    //MARK: POSISI PUZZLE BESAR
    puzzleBesarBadanKapalBawah.scale(to: CGSize(width: 1200, height: 420))
    puzzleBesarBadanKapalBawah.position = CGPoint(x: size.width/2.35, y: size.height/2.7)
    puzzleBesarBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalBawah.alpha = 1
    puzzleBesarBadanKapalBawah.zPosition = 2
    addChild(puzzleBesarBadanKapalBawah)
    
    puzzleBesarGarisKapal.scale(to: CGSize(width: 1349, height: 229))
    puzzleBesarGarisKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
    puzzleBesarGarisKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarGarisKapal.zPosition = 3
    puzzleBesarGarisKapal.alpha = 1
    addChild(puzzleBesarGarisKapal)
    
    puzzleBesarBadanKapalBiru.scale(to: CGSize(width: 716, height: 174))
    puzzleBesarBadanKapalBiru.position = CGPoint(x: size.width/2, y: size.height/2)
    puzzleBesarBadanKapalBiru.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalBiru.zPosition = 2
    puzzleBesarBadanKapalBiru.alpha = 1
    addChild(puzzleBesarBadanKapalBiru)
    
    
    puzzleBesarJendelaBanyakKapal.scale(to: CGSize(width: 531, height: 135))
    puzzleBesarJendelaBanyakKapal.position = CGPoint(x: size.width/2, y: size.height/2)
    puzzleBesarJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaBanyakKapal.zPosition = 2
    puzzleBesarJendelaBanyakKapal.alpha = 3
    addChild(puzzleBesarJendelaBanyakKapal)
    
    puzzleBesarPelampung.scale(to: CGSize(width: 178, height: 164))
    puzzleBesarPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
    puzzleBesarPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarPelampung.zPosition = 5
    puzzleBesarPelampung.alpha = 1
    addChild(puzzleBesarPelampung)
    
    puzzleBesarBulatKapal.scale(to: CGSize(width: 578, height: 177))
    puzzleBesarBulatKapal.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
    puzzleBesarBulatKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBulatKapal.zPosition = 4
    puzzleBesarBulatKapal.alpha = 1
    addChild(puzzleBesarBulatKapal)
    
    puzzleBesarBenderaKapal.scale(to: CGSize(width: 95, height: 155))
    puzzleBesarBenderaKapal.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
    puzzleBesarBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBenderaKapal.zPosition = 3
    puzzleBesarBenderaKapal.alpha = 1
    addChild(puzzleBesarBenderaKapal)
    
    puzzleBesarBadanKapalAtas.scale(to: CGSize(width: 334, height: 189))
    puzzleBesarBadanKapalAtas.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
    puzzleBesarBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalAtas.zPosition = 2
    puzzleBesarBadanKapalAtas.alpha = 1
    addChild(puzzleBesarBadanKapalAtas)
    
    puzzleBesarJendelaKapalAtas.scale(to: CGSize(width: 125, height: 83))
    puzzleBesarJendelaKapalAtas.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
    puzzleBesarJendelaKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaKapalAtas.zPosition = 3
    puzzleBesarJendelaKapalAtas.alpha = 1
    addChild(puzzleBesarJendelaKapalAtas)
    
    puzzleBesarGarisMerahKapal.scale(to: CGSize(width: 401, height: 73))
    puzzleBesarGarisMerahKapal.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
    puzzleBesarGarisMerahKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarGarisMerahKapal.zPosition = 3
    puzzleBesarGarisMerahKapal.alpha = 1
    addChild(puzzleBesarGarisMerahKapal)
    
    scrollView = CustomScrollView(frame: CGRect(x: self.frame.size.width / 3.06, y: self.frame.size.height / 80, width: self.frame.size.width / 12, height: self.frame.size.height / 4.9), scene: self, moveableNode: moveableNode, scrollDirection: .vertical)
    
    scrollView.contentSize = CGSize(width: self.frame.size.width, height: self.frame.size.height * 1.5)
    
//    scrollView.backgroundColor = UIColor.blue
    
    
    view.addSubview(scrollView)

    addChild(moveableNode)
    
    moveableNode.addChild(puzzleKecilPelampung)
    moveableNode.addChild(puzzleKecilGarisKapal)
    moveableNode.addChild(puzzleKecilBenderaKapal)
    moveableNode.addChild(puzzleKecilBadanKapalAtas)
    moveableNode.addChild(puzzleKecilBadanKapalBiru)
    moveableNode.addChild(puzzleKecilGarisMerahKapal)
    moveableNode.addChild(puzzleKecilBulatKapal)
    moveableNode.addChild(puzzleKecilJendelaBanyakKapal)
    moveableNode.addChild(puzzleKecilJendelaKapalAtas)
    moveableNode.addChild(puzzleKecilBadanKapalBawah)
    
    if puzzleKecilPelampung.position.y >= scrollView.frame.maxY{
      puzzleKecilPelampung.isHidden = true
    } else if puzzleKecilPelampung.position.y <= scrollView.frame.maxY{
      puzzleKecilPelampung.isHidden = false
    }
    
    print("\(scrollView.frame.size)")
    print("\(kayuPuzzle.frame.size)")
    
  }
  
  @objc func handlePanFrom(recognizer: UIPanGestureRecognizer) {
    if recognizer.state != .changed {
      return
    }
    
    // Get touch delta
    let translation = recognizer.translation(in: recognizer.view!)
    
    // Move camera
    self.camera?.position.x -= translation.x
    self.camera?.position.y += translation.y
    
    // Reset
    recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
  }
  
  
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      //      let location = touch.location(in: self)
      //      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapal.name {
      //        if puzzleKecilBadanKapal.position != puzzleBesarBadanKapal.position{
      //          puzzleKecilBadanKapal.position = location
      //          puzzleKecilBadanKapal.scale(to: CGSize(width: 1213, height: 391))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilPelampung.name {
      //        if puzzleKecilPelampung.position != puzzleBesarPelampung.position{
      //          puzzleKecilPelampung.position = location
      //          puzzleKecilPelampung.scale(to: CGSize(width: 248, height: 108))
      //        }
      //      }
      //
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilAtapKapal.name {
      //        if puzzleKecilAtapKapal.position != puzzleBesarAtapKapal.position{
      //          puzzleKecilAtapKapal.position = location
      //          puzzleKecilAtapKapal.scale(to: CGSize(width: 375, height: 94))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKapal.name {
      //        if puzzleKecilGarisKapal.position != puzzleBesarGarisKapal.position{
      //          puzzleKecilGarisKapal.position = location
      //          puzzleKecilGarisKapal.scale(to: CGSize(width: 1354, height: 227))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKapal.name {
      //        if puzzleKecilGarisKapal.position != puzzleBesarGarisKapal.position{
      //          puzzleKecilGarisKapal.position = location
      //          puzzleKecilGarisKapal.scale(to: CGSize(width: 1354, height: 227))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilBadanAtasKapal1.name {
      //        if puzzleKecilBadanAtasKapal1.position != puzzleBesarBadanAtasKapal1.position{
      //          puzzleKecilBadanAtasKapal1.position = location
      //          puzzleKecilBadanAtasKapal1.scale(to: CGSize(width: 446, height: 253))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilBadanAtasKapal2.name {
      //        if puzzleKecilBadanAtasKapal2.position != puzzleBesarBadanAtasKapal2.position{
      //          puzzleKecilBadanAtasKapal2.position = location
      //          puzzleKecilBadanAtasKapal2.scale(to: CGSize(width: 362, height: 135))
      //        }
      //      }
      //
      //      if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal.name {
      //        if puzzleKecilJendelaKapal.position != puzzleBesarJendelaKapal.position{
      //          puzzleKecilJendelaKapal.position = location
      //          puzzleKecilJendelaKapal.scale(to: CGSize(width: 246, height: 135))
      //        }
      //      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame){
    //      puzzleKecilBadanKapal.position = CGPoint(x: size.width/2.25, y: size.height/2.7)
    //      puzzleKecilBadanKapal.isUserInteractionEnabled = false
    //      puzzleKecilBadanKapal.zPosition = 2
    //    } else{
    //      self.puzzleKecilBadanKapal.scale(to: CGSize(width: 320, height: 100))
    //      self.puzzleKecilBadanKapal.position = CGPoint(x: self.size.width/1.11, y: self.size.height/1.4)
    //    }
    //
    //    if puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame){
    //      puzzleKecilPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
    //      puzzleKecilPelampung.isUserInteractionEnabled = true
    //      puzzleKecilPelampung.zPosition = 4
    //    } else{
    //      puzzleKecilPelampung.position = CGPoint(x: size.width/1.1, y: size.height/1.60)
    //      puzzleKecilPelampung.scale(to: CGSize(width: 230, height: 100))
    //    }
    //
    //    if puzzleKecilBadanAtasKapal2.frame.intersects(puzzleBesarBadanAtasKapal2.frame){
    //      puzzleKecilBadanAtasKapal2.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
    //      puzzleKecilBadanAtasKapal2.isUserInteractionEnabled = true
    //    }else{
    //      puzzleKecilBadanAtasKapal2.position = CGPoint(x: size.width/1.1, y: size.height/1.85)
    //      puzzleKecilBadanAtasKapal2.scale(to: CGSize(width: 230, height: 90))
    //    }
    //
    //    if puzzleKecilBadanAtasKapal1.frame.intersects(puzzleBesarBadanAtasKapal1.frame){
    //      puzzleKecilBadanAtasKapal1.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
    //      puzzleKecilBadanAtasKapal1.isUserInteractionEnabled = true
    //    } else{
    //      puzzleKecilBadanAtasKapal1.position = CGPoint(x: size.width/1.1, y: size.height/2.15)
    //      puzzleKecilBadanAtasKapal1.scale(to: CGSize(width: 230, height: 100))
    //    }
    //
    //    if puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame){
    //      puzzleKecilAtapKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
    //      puzzleKecilAtapKapal.isUserInteractionEnabled = true
    //      puzzleKecilAtapKapal.zPosition = 4
    //    }else{
    //      puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.1, y: size.height/2.55)
    //      puzzleKecilAtapKapal.scale(to: CGSize(width: 230, height: 60))
    //    }
    //
    //    if puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame){
    //      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
    //      puzzleKecilJendelaKapal.isUserInteractionEnabled = true
    //    } else{
    //      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.00)
    //      puzzleKecilJendelaKapal.scale(to: CGSize(width: 230, height: 100))
    //    }
    //
    //    if puzzleKecilGarisKapal.frame.intersects(puzzleBesarGarisKapal.frame){
    //      puzzleKecilGarisKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
    //      puzzleKecilGarisKapal.isUserInteractionEnabled = true
    //      puzzleKecilGarisKapal.zPosition = 3
    //    } else{
    //      puzzleKecilGarisKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.60)
    //      puzzleKecilGarisKapal.scale(to: CGSize(width: 350, height: 70))
    //    }
    //
    //    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame) && puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame) && puzzleKecilBadanAtasKapal2.frame.intersects(puzzleBesarBadanAtasKapal2.frame) && puzzleKecilBadanAtasKapal1.frame.intersects(puzzleBesarBadanAtasKapal1.frame) && puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame) && puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame) && puzzleKecilGarisKapal.frame.intersects(puzzleBesarGarisKapal.frame) {
    //      print("succes")
    //    } else{
    //      print("belum lengkap")
    //    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  
  override func update(_ currentTime: TimeInterval) {
    //    camera?.position = kayuPuzzle.position
  }
  
}

class ScrollScene : SKScene {
    // Layer Vars
    let scrollLayer = SKNode()

    // General Vars
    var originalPosY = CGFloat(0)


    // ================================================================================================
    // MARK: Initializers
    // ================================================================================================
    override init() {
        super.init()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // ================================================================================================
    // MARK: Public Functions
    // ================================================================================================
    func scrollBy(contentOffset: CGFloat) {
        scrollLayer.position.y = originalPosY + contentOffset
    }


    func viewDidTapPoint(viewPoint: CGPoint, contentOffset: CGFloat) {
        let nodes = getNodesTouchedFromView(point: viewPoint, contentOffset: contentOffset)
    }


    func getScrollHeight() -> CGFloat {
        return scrollLayer.calculateAccumulatedFrame().height
    }


    fileprivate func getNodesTouchedFromView(point: CGPoint, contentOffset: CGFloat) -> [SKNode] {
        var scenePoint = convertPoint(fromView: point)
        scenePoint.y += contentOffset
        return scrollLayer.nodes(at: scenePoint)
    }
}
