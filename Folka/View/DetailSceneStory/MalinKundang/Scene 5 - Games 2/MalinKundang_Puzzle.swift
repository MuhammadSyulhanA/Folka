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

class MalinKundang_Puzzle: SKScene{
  let popUpPuzzle = SKSpriteNode(imageNamed: "popUpPuzzleSatu")
  let popUpSuksesKapal = SKSpriteNode(imageNamed: "popUpSuksesKapalSatu")
  let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
  let buttonTutup = SKSpriteNode(imageNamed: "buttonTutup")
  let buttonTutupAction: SKAction?
  let buttonNextStory = SKSpriteNode(imageNamed: "buttonLanjutkanCerita")
  var buttonNextStoryAction: SKAction?
  let buttonReplayGame = SKSpriteNode(imageNamed: "buttonMainLagi")
  var buttonReplayAction: SKAction?
  
  let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
  let kayuPuzzle = SKSpriteNode(imageNamed: "kayuPuzzle")
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  let buttonHomeAction: SKAction?
  let buttonTanya = SKSpriteNode(imageNamed: "buttonTanya")
  let buttonTanyaAction: SKAction?
  let outlineKapal = SKSpriteNode(imageNamed: "outlineKapalPuzzleSatu")
  
  //MARK: PUZZLE KECIL
  let puzzleKecilBadanKapal = SKSpriteNode(imageNamed: "badanKapal")
  let puzzleKecilAtapKapal = SKSpriteNode(imageNamed: "atapKapalMerah")
  let puzzleKecilBadanKapalDepan = SKSpriteNode(imageNamed: "badanKapalDepan")
  let puzzleKecilBadanKapalBelakang = SKSpriteNode(imageNamed: "badanKapalBelakang")
  let puzzleKecilGarisKuningKapal = SKSpriteNode(imageNamed: "garisKuningKapal")
  let puzzleKecilJendelaKapal = SKSpriteNode(imageNamed: "jendelaKapal")
  let puzzleKecilPelampung = SKSpriteNode(imageNamed: "pelampungKapal")
  
  //MARK: PUZZLE BESAR
  let puzzleBesarBadanKapal = SKSpriteNode(imageNamed: "badanKapal")
  let puzzleBesarAtapKapal = SKSpriteNode(imageNamed: "atapKapalMerah")
  let puzzleBesarBadanKapalDepan = SKSpriteNode(imageNamed: "badanKapalDepan")
  let puzzleBesarBadanKapalBelakang = SKSpriteNode(imageNamed: "badanKapalBelakang")
  let puzzleBesarGarisKuningKapal = SKSpriteNode(imageNamed: "garisKuningKapal")
  let puzzleBesarJendelaKapal = SKSpriteNode(imageNamed: "jendelaKapal")
  let puzzleBesarPelampung = SKSpriteNode(imageNamed: "pelampungKapal")
  
  override init(size: CGSize){
    buttonTutupAction = SKAction.resize(toWidth: 550, height: 130, duration: 2.0)
    buttonTanyaAction = SKAction.resize(toWidth: 120, height: 130, duration: 2.0)
    buttonHomeAction = SKAction.resize(toWidth: 120, height: 130, duration: 2.0)
    buttonReplayAction = SKAction.resize(toWidth: 550, height: 110, duration: 2.0)
    buttonNextStoryAction = SKAction.resize(toWidth: 550, height: 110, duration: 2.0)
    
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func didMove(to view: SKView) {
    self.backgroundColor = SKColor.white
    backgroundOpacity.size = CGSize(width: 2050, height: 1120)
    backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundOpacity.zPosition = 4
    backgroundOpacity.isHidden = false
    addChild(backgroundOpacity)
    
    popUpPuzzle.size = CGSize(width: 1450, height: 850)
    popUpPuzzle.name = "failed"
    popUpPuzzle.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpPuzzle.zPosition = 5
    popUpPuzzle.isHidden = false
    addChild(popUpPuzzle)
    
    popUpSuksesKapal.size = CGSize(width: 1450, height: 850)
    popUpSuksesKapal.name = "failed"
    popUpSuksesKapal.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpSuksesKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpSuksesKapal.zPosition = 5
    popUpSuksesKapal.isHidden = true
    addChild(popUpSuksesKapal)
    
    buttonNextStory.size = CGSize(width: 580, height: 130)
    buttonNextStory.name = "nextStory"
    buttonNextStory.position = CGPoint(x: size.width/1.5, y: size.height/2.9)
    buttonNextStory.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonNextStory.zPosition = 6
    buttonNextStory.isHidden = true
    addChild(buttonNextStory)
    
    buttonReplayGame.size = CGSize(width: 580, height: 130)
    buttonReplayGame.name = "replayGame"
    buttonReplayGame.position = CGPoint(x: size.width/2.9, y: size.height/2.9)
    buttonReplayGame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonReplayGame.zPosition = 6
    buttonReplayGame.isHidden = true
    addChild(buttonReplayGame)
    
    buttonTutup.size = CGSize(width: 580, height: 130)
    buttonTutup.name = "buttonTutup"
    buttonTutup.position = CGPoint(x: size.width/2, y: size.height/3.4)
    buttonTutup.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTutup.zPosition = 6
    buttonTutup.isHidden = false
    addChild( buttonTutup)
    
    background.size = CGSize(width: 2040, height: 1120)
    background.position = CGPoint(x: size.width/2, y: size.height/2)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.zPosition = -1
    addChild(background)
    
    outlineKapal.size = CGSize(width: 1346, height: 634)
    outlineKapal.position = CGPoint(x: size.width/2.308, y: size.height/2.2)
    outlineKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    outlineKapal.zPosition = 2
    addChild(outlineKapal)
    
    buttonHome.size = CGSize(width: 130, height: 130)
    buttonHome.position = CGPoint(x: size.width/16, y: size.height/1.35)
    buttonHome.name = "buttonHome"
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    addChild(buttonHome)
    
    buttonTanya.size = CGSize(width: 120, height: 120)
    buttonTanya.position = CGPoint(x: size.width/16, y: size.height/1.55)
    buttonTanya.name = "buttonTanya"
    buttonTanya.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTanya.zPosition = 2
    addChild(buttonTanya)
    
    kayuPuzzle.scale(to: CGSize(width: 390, height: 1000))
    kayuPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2)
    kayuPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kayuPuzzle.zPosition = 1
    addChild(kayuPuzzle)
    
    //MARK: POSISI PUZZLE KECIL
    puzzleKecilBadanKapal.name = "puzzleKecilBadanKapal"
    puzzleKecilBadanKapal.scale(to: CGSize(width: 320, height: 100))
    puzzleKecilBadanKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
    puzzleKecilBadanKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapal.shadowedBitMask = 1
    puzzleKecilBadanKapal.zPosition = 3
    addChild(puzzleKecilBadanKapal)
    
    
    puzzleKecilPelampung.name = "puzzleKecilPelampung"
    puzzleKecilPelampung.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
    puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilPelampung.zPosition = 3
    addChild(puzzleKecilPelampung)
    
    puzzleKecilBadanKapalBelakang.name = "puzzleKecilBadanAtasKapal2"
    puzzleKecilBadanKapalBelakang.scale(to: CGSize(width: 230, height: 90))
    puzzleKecilBadanKapalBelakang.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
    puzzleKecilBadanKapalBelakang.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalBelakang.zPosition = 3
    addChild(puzzleKecilBadanKapalBelakang)
    
    puzzleKecilBadanKapalDepan.name = "puzzleKecilBadanAtasKapal1"
    puzzleKecilBadanKapalDepan.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilBadanKapalDepan.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
    puzzleKecilBadanKapalDepan.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalDepan.zPosition = 3
    addChild(puzzleKecilBadanKapalDepan)
    
    puzzleKecilAtapKapal.name = "puzzleKecilAtapKapal"
    puzzleKecilAtapKapal.scale(to: CGSize(width: 230, height: 60))
    puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
    puzzleKecilAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilAtapKapal.zPosition = 3
    addChild(puzzleKecilAtapKapal)
    
    puzzleKecilJendelaKapal.name = "puzzleKecilJendelaKapal"
    puzzleKecilJendelaKapal.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
    puzzleKecilJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapal.zPosition = 3
    addChild(puzzleKecilJendelaKapal)
    
    puzzleKecilGarisKuningKapal.name = "puzzleKecilGarisKapal"
    puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 350, height: 70))
    puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
    puzzleKecilGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKuningKapal.zPosition = 3
    addChild(puzzleKecilGarisKuningKapal)
    
    
    //MARK: POSISI PUZZLE BESAR
    puzzleBesarBadanKapal.scale(to: CGSize(width: 1213, height: 391))
    puzzleBesarBadanKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
    puzzleBesarBadanKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapal.alpha = 0
    puzzleBesarBadanKapal.zPosition = 2
    addChild(puzzleBesarBadanKapal)
    
    puzzleBesarGarisKuningKapal.scale(to: CGSize(width: 1354, height: 227))
    puzzleBesarGarisKuningKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
    puzzleBesarGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarGarisKuningKapal.zPosition = 2
    puzzleBesarGarisKuningKapal.alpha = 0
    addChild(puzzleBesarGarisKuningKapal)
    
    puzzleBesarPelampung.scale(to: CGSize(width: 248, height: 108))
    puzzleBesarPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
    puzzleBesarPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarPelampung.zPosition = 4
    puzzleBesarPelampung.alpha = 0
    addChild(puzzleBesarPelampung)
    
    puzzleBesarBadanKapalBelakang.scale(to: CGSize(width: 362, height: 135))
    puzzleBesarBadanKapalBelakang.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
    puzzleBesarBadanKapalBelakang.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalBelakang.zPosition = 2
    puzzleBesarBadanKapalBelakang.alpha = 0
    addChild(puzzleBesarBadanKapalBelakang)
    
    puzzleBesarBadanKapalDepan.scale(to: CGSize(width: 446, height: 253))
    puzzleBesarBadanKapalDepan.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
    puzzleBesarBadanKapalDepan.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalDepan.zPosition = 2
    puzzleBesarBadanKapalDepan.alpha = 0
    addChild(puzzleBesarBadanKapalDepan)
    
    puzzleBesarAtapKapal.scale(to: CGSize(width: 375, height: 94))
    puzzleBesarAtapKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
    puzzleBesarAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarAtapKapal.zPosition = 3
    puzzleBesarAtapKapal.alpha = 0
    addChild(puzzleBesarAtapKapal)
    
    puzzleBesarJendelaKapal.scale(to: CGSize(width: 246, height: 135))
    puzzleBesarJendelaKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
    puzzleBesarJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaKapal.zPosition = 1
    puzzleBesarJendelaKapal.alpha = 0
    addChild(puzzleBesarJendelaKapal)
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapal.name {
        if puzzleKecilBadanKapal.position != puzzleBesarBadanKapal.position{
          puzzleKecilBadanKapal.position = location
          puzzleKecilBadanKapal.inputView?.isMultipleTouchEnabled = false
          puzzleKecilBadanKapal.zPosition = 2
          puzzleKecilBadanKapal.scale(to: CGSize(width: 1213, height: 391))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilPelampung.name {
        if puzzleKecilPelampung.position != puzzleBesarPelampung.position{
          puzzleKecilPelampung.position = location
          puzzleKecilPelampung.zPosition = 4
          puzzleKecilPelampung.inputView?.isMultipleTouchEnabled = true
          puzzleKecilPelampung.scale(to: CGSize(width: 248, height: 108))
        }
      }
      
      
      if atPoint((touch.location(in: self))).name == puzzleKecilAtapKapal.name {
        if puzzleKecilAtapKapal.position != puzzleBesarAtapKapal.position{
          puzzleKecilAtapKapal.position = location
          puzzleKecilAtapKapal.zPosition = 4
          puzzleKecilAtapKapal.inputView?.isMultipleTouchEnabled = true
          puzzleKecilAtapKapal.scale(to: CGSize(width: 375, height: 94))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKuningKapal.name {
        if puzzleKecilGarisKuningKapal.position != puzzleBesarGarisKuningKapal.position{
          puzzleKecilGarisKuningKapal.position = location
          puzzleKecilGarisKuningKapal.inputView?.isMultipleTouchEnabled = true
          puzzleKecilGarisKuningKapal.zPosition = 3
          puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 1354, height: 227))
        }
      }
      
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalDepan.name {
        if puzzleKecilBadanKapalDepan.position != puzzleBesarBadanKapalDepan.position{
          puzzleKecilBadanKapalDepan.position = location
          puzzleKecilBadanKapalDepan.inputView?.isMultipleTouchEnabled = true
          puzzleKecilBadanKapalDepan.zPosition = 3
          puzzleKecilBadanKapalDepan.scale(to: CGSize(width: 446, height: 253))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalBelakang.name {
        if puzzleKecilBadanKapalBelakang.position != puzzleBesarBadanKapalBelakang.position{
          puzzleKecilBadanKapalBelakang.position = location
          puzzleKecilBadanKapalBelakang.inputView?.isMultipleTouchEnabled = true
          puzzleKecilBadanKapalBelakang.zPosition = 3
          puzzleKecilBadanKapalBelakang.scale(to: CGSize(width: 362, height: 135))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal.name {
        if puzzleKecilJendelaKapal.position != puzzleBesarJendelaKapal.position{
          puzzleKecilJendelaKapal.position = location
          puzzleKecilJendelaKapal.inputView?.isMultipleTouchEnabled = true
          puzzleKecilJendelaKapal.zPosition = 3
          puzzleKecilJendelaKapal.scale(to: CGSize(width: 246, height: 135))
        }
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame){
      puzzleKecilBadanKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
      puzzleKecilBadanKapal.inputView?.isMultipleTouchEnabled = false
    } else{
      puzzleKecilBadanKapal.scale(to: CGSize(width: 320, height: 100))
      puzzleKecilBadanKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
    }
    
    if puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame){
      puzzleKecilPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
      puzzleKecilPelampung.inputView?.isMultipleTouchEnabled = true
    } else{
      puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
      puzzleKecilPelampung.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilBadanKapalBelakang.frame.intersects(puzzleBesarBadanKapalBelakang.frame){
      puzzleKecilBadanKapalBelakang.position = CGPoint(x: size.width/1.66, y: size.height/1.98)
      puzzleKecilBadanKapalBelakang.isUserInteractionEnabled = true
      puzzleKecilBadanKapalBelakang.inputView?.isMultipleTouchEnabled = true
    }else{
      puzzleKecilBadanKapalBelakang.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
      puzzleKecilBadanKapalBelakang.scale(to: CGSize(width: 230, height: 90))
    }
    
    if puzzleKecilBadanKapalDepan.frame.intersects(puzzleBesarBadanKapalDepan.frame){
      puzzleKecilBadanKapalDepan.position = CGPoint(x: size.width/2.85, y: size.height/1.8)
      puzzleKecilBadanKapalDepan.isUserInteractionEnabled = true
      puzzleKecilBadanKapalDepan.inputView?.isMultipleTouchEnabled = true
    } else{
      puzzleKecilBadanKapalDepan.isUserInteractionEnabled = false
      puzzleKecilBadanKapalDepan.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
      puzzleKecilBadanKapalDepan.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame){
      puzzleKecilAtapKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
      puzzleKecilAtapKapal.inputView?.isMultipleTouchEnabled = true
    }else{
      puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
      puzzleKecilAtapKapal.scale(to: CGSize(width: 230, height: 60))
    }
    
    if puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame){
      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
      puzzleKecilJendelaKapal.inputView?.isMultipleTouchEnabled = true
    } else{
      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
      puzzleKecilJendelaKapal.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilGarisKuningKapal.frame.intersects(puzzleBesarGarisKuningKapal.frame){
      puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/2.32, y: size.height/2.05)
      puzzleKecilGarisKuningKapal.isUserInteractionEnabled = true
      puzzleKecilGarisKuningKapal.inputView?.isMultipleTouchEnabled = true
    } else{
      puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
      puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 350, height: 70))
    }
    
    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame) && puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame) && puzzleKecilBadanKapalBelakang.frame.intersects(puzzleBesarBadanKapalBelakang.frame) && puzzleKecilBadanKapalDepan.frame.intersects(puzzleBesarBadanKapalDepan.frame) && puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame) && puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame) && puzzleKecilGarisKuningKapal.frame.intersects(puzzleBesarGarisKuningKapal.frame) {
      gameFinish()
    } else{
      print("belum lengkap")
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    print(atPoint((touch?.location(in: self))!))
    if atPoint((touch?.location(in: self))!).name == buttonTutup.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonTutup" {
          buttonTutupSceneAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonTanya.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonTanya" {
          buttonTanyaAksi()
          print("tanya")
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonHome.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonHome" {
          buttonHomeAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonReplayGame.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "replayGame" {
          buttonBackToGame()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonNextStory.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "nextStory" {
          buttonNextStoryScene()
        }
      }
    }
    
    
  }
  
  
  func buttonTutupSceneAksi() {
    popUpPuzzle.isHidden = true
    buttonTutup.isHidden = true
    backgroundOpacity.isHidden = true
  }
  
  func buttonBackToGame() {
    let prevScene = ScenePilihGame_ViewController(nibName: "ScenePilihGame_ViewController", bundle: nil)
    self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
  }
  
  func gameFinish(){
    backgroundOpacity.isHidden = false
    popUpSuksesKapal.isHidden = false
    buttonNextStory.isHidden = false
    buttonReplayGame.isHidden = false
  }
  
  func buttonTanyaAksi(){
    popUpPuzzle.isHidden = false
    buttonTutup.isHidden = false
    backgroundOpacity.isHidden = false
  }
  
  func buttonHomeAksi(){
//    let nextDetailPage = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
//    self.view!.window?.rootViewController?.present(nextDetailPage, animated: true, completion: nil)
  }
  
  func buttonNextStoryScene() {
    if buttonNextStory.action(forKey: "Button Next") == nil {
      buttonNextStory.run(SKAction.repeatForever(buttonNextStoryAction!), withKey: "Button Next")
      let reveal = SKTransition.reveal(with: .left, duration: 1)
      let newScene = MalinKundang_Scene6(size: CGSize(width: 2050, height: 1536))
      newScene.scaleMode = .aspectFill
      scene?.view!.presentScene(newScene, transition: reveal)
    }
  }
  
  override func update(_ currentTime: TimeInterval) {
    
  }
  
}

