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

class MalinKundang_PuzzleBesar: SKScene{
  var scrollView: CustomScrollView!
  let moveableNode = SKNode()
  
  let popUpPuzzle = SKSpriteNode(imageNamed: "popUpPuzzleSatu")
  let popUpSuksesKapal = SKSpriteNode(imageNamed: "popUpSuksesKapalSatu")
  let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
  let buttonTutup = SKSpriteNode(imageNamed: "buttonTutup")
  let buttonTutupAction: SKAction?
  let buttonNextStory = SKSpriteNode(imageNamed: "buttonLanjutkanCeritaPuzzle")
  var buttonNextStoryAction: SKAction?
  let buttonReplayGame = SKSpriteNode(imageNamed: "buttonMainLagiPuzzle")
  var buttonReplayAction: SKAction?
  
  //  var scrollGround: UIView!
  let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
  let kayuPuzzle = SKSpriteNode(imageNamed: "kayuPuzzle")
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  let buttonHomeAction: SKAction?
  let buttonTanya = SKSpriteNode(imageNamed: "buttonTanya")
  let buttonTanyaAction: SKAction?
  let outlineKapal = SKSpriteNode(imageNamed: "outlineKapalPuzzleDua")
  
  //MARK: PUZZLE KECIL
  let puzzleKecilBadanKapalAtas = SKSpriteNode(imageNamed: "badanKapalAtas")
  let puzzleKecilBadanKapalBawah = SKSpriteNode(imageNamed: "badanKapalBawah")
  let puzzleKecilBadanKapalTengah = SKSpriteNode(imageNamed: "badanKapalTengah")
  let puzzleKecilBulatKapal = SKSpriteNode(imageNamed: "bulatTigaKapal")
  let puzzleKecilGarisKuningKapal = SKSpriteNode(imageNamed: "garisKuningKapal")
  let puzzleKecilAtapKapal = SKSpriteNode(imageNamed: "atapKapalDua")
  let puzzleKecilJendelaBanyakKapal = SKSpriteNode(imageNamed: "jendelaBanyakKapal")
  let puzzleKecilJendelaKapal = SKSpriteNode(imageNamed: "jendelaKapalDua")
  let puzzleKecilBenderaKapal = SKSpriteNode(imageNamed: "benderaKapal")
  let puzzleKecilPelampung = SKSpriteNode(imageNamed: "pelampungKapalDua")
  
  //MARK: PUZZLE BESAR
  let puzzleBesarBadanKapalAtas = SKSpriteNode(imageNamed: "badanKapalAtas")
  let puzzleBesarBadanKapalBawah = SKSpriteNode(imageNamed: "badanKapalBawah")
  let puzzleBesarBadanKapalTengah = SKSpriteNode(imageNamed: "badanKapalTengah")
  let puzzleBesarBulatKapal = SKSpriteNode(imageNamed: "bulatTigaKapal")
  let puzzleBesarGarisKuningKapal = SKSpriteNode(imageNamed: "garisKuningKapal")
  let puzzleBesarAtapKapal = SKSpriteNode(imageNamed: "atapKapalDua")
  let puzzleBesarJendelaBanyakKapal = SKSpriteNode(imageNamed: "jendelaBanyakKapal")
  let puzzleBesarJendelaKapal = SKSpriteNode(imageNamed: "jendelaKapalDua")
  let puzzleBesarBenderaKapal = SKSpriteNode(imageNamed: "benderaKapal")
  let puzzleBesarPelampung = SKSpriteNode(imageNamed: "pelampungKapalDua")
  
  // sound
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  var soundSucces: SKAction = SKAction.playSoundFileNamed("soundSucces", waitForCompletion: true)
  var soundFailed: SKAction = SKAction.playSoundFileNamed("soundFailed", waitForCompletion: true)
  
  override init(size: CGSize){
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    buttonTutupAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonTanyaAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonReplayAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonNextStoryAction = SKAction.sequence([buttonToSmall, buttonToBig])
    
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
    
    popUpPuzzle.size = CGSize(width: 1250, height: 820)
    popUpPuzzle.name = "failed"
    popUpPuzzle.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpPuzzle.zPosition = 7
    popUpPuzzle.isHidden = false
    addChild(popUpPuzzle)
    
    popUpSuksesKapal.size = CGSize(width: 1250, height: 820)
    popUpSuksesKapal.name = "failed"
    popUpSuksesKapal.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpSuksesKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpSuksesKapal.zPosition = 7
    popUpSuksesKapal.isHidden = true
    addChild(popUpSuksesKapal)
    
    buttonNextStory.size = CGSize(width: 500, height: 130)
    buttonNextStory.name = "nextStory"
    buttonNextStory.position = CGPoint(x: size.width/1.5, y: size.height/2.8)
    buttonNextStory.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonNextStory.zPosition = 8
    buttonNextStory.isHidden = true
    addChild(buttonNextStory)
    
    buttonReplayGame.size = CGSize(width: 500, height: 130)
    buttonReplayGame.name = "replayGame"
    buttonReplayGame.position = CGPoint(x: size.width/2.9, y: size.height/2.8)
    buttonReplayGame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonReplayGame.zPosition = 8
    buttonReplayGame.isHidden = true
    addChild(buttonReplayGame)
    
    buttonTutup.size = CGSize(width: 580, height: 130)
    buttonTutup.name = "buttonTutup"
    buttonTutup.position = CGPoint(x: size.width/2, y: size.height/3.4)
    buttonTutup.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTutup.zPosition = 8
    buttonTutup.isHidden = false
    addChild( buttonTutup)
    
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
    buttonHome.name = "buttonHome"
    addChild(buttonHome)
    
    buttonTanya.size = CGSize(width: 130, height: 130)
    buttonTanya.position = CGPoint(x: size.width/16, y: size.height/1.55)
    buttonTanya.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTanya.zPosition = 2
    buttonTanya.name = "buttonTanya"
    addChild(buttonTanya)
    
    kayuPuzzle.scale(to: CGSize(width: 390, height: 1000))
    kayuPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2)
    kayuPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kayuPuzzle.zPosition = 2
    addChild(kayuPuzzle)
    
    
    puzzleKecilBulatKapal.name = "puzzleKecilBulatKapal"
    puzzleKecilBulatKapal.scale(to: CGSize(width: 250, height: 55))
    puzzleKecilBulatKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
    puzzleKecilBulatKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBulatKapal.zPosition = 3
    addChild(puzzleKecilBulatKapal)
    
    puzzleKecilAtapKapal.name = "puzzleKecilAtapKapal"
    puzzleKecilAtapKapal.scale(to: CGSize(width: 200, height: 40))
    puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.42)
    puzzleKecilAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilAtapKapal.zPosition = 3
    addChild(puzzleKecilAtapKapal)
    
    puzzleKecilBenderaKapal.name = "puzzleKecilBenderaKapal"
    puzzleKecilBenderaKapal.scale(to: CGSize(width: 40, height: 60))
    puzzleKecilBenderaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.52)
    puzzleKecilBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBenderaKapal.zPosition = 3
    addChild(puzzleKecilBenderaKapal)
    
    puzzleKecilJendelaKapal.name = "puzzleKecilJendelaKapal"
    puzzleKecilJendelaKapal.scale(to: CGSize(width: 90, height: 60))
    puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.65)
    puzzleKecilJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapal.zPosition = 3
    addChild(puzzleKecilJendelaKapal)
    
    puzzleKecilBadanKapalAtas.name = "puzzleKecilBadanKapalAtas"
    puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 200, height: 80))
    puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.13, y: size.height/1.82)
    puzzleKecilBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalAtas.zPosition = 3
    addChild(puzzleKecilBadanKapalAtas)
    
    puzzleKecilGarisKuningKapal.name = "puzzleKecilGarisKuningKapal"
    puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 250, height: 50))
    puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
    puzzleKecilGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKuningKapal.zPosition = 3
    addChild(puzzleKecilGarisKuningKapal)
    
    puzzleKecilBadanKapalTengah.name = "puzzleKecilBadanKapalTengah"
    puzzleKecilBadanKapalTengah.scale(to: CGSize(width: 230, height: 70))
    puzzleKecilBadanKapalTengah.position = CGPoint(x: size.width/1.13, y: size.height/2.30)
    puzzleKecilBadanKapalTengah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalTengah.zPosition = 3
    addChild(puzzleKecilBadanKapalTengah)
    
    puzzleKecilPelampung.name = "puzzleKecilPelampung"
    puzzleKecilPelampung.scale(to: CGSize(width: 70, height: 60))
    puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/2.60)
    puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilPelampung.zPosition = 3
    addChild(puzzleKecilPelampung)
    
    puzzleKecilJendelaBanyakKapal.name = "puzzleKecilJendelaBanyakKapal"
    puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 230, height: 70))
    puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.00)
    puzzleKecilJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaBanyakKapal.zPosition = 3
    addChild(puzzleKecilJendelaBanyakKapal)
    
    puzzleKecilBadanKapalBawah.name = "puzzleKecilBadanKapalBawah"
    puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 250, height: 90))
    puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.13, y: size.height/3.80)
    puzzleKecilBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalBawah.zPosition = 3
    addChild(puzzleKecilBadanKapalBawah)
    
    
    //MARK: POSISI PUZZLE BESAR
    puzzleBesarBadanKapalBawah.scale(to: CGSize(width: 1200, height: 420))
    puzzleBesarBadanKapalBawah.position = CGPoint(x: size.width/2.35, y: size.height/2.68)
    puzzleBesarBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalBawah.alpha = 0
    puzzleBesarBadanKapalBawah.zPosition = 2
    addChild(puzzleBesarBadanKapalBawah)
    
    puzzleBesarGarisKuningKapal.scale(to: CGSize(width: 1280, height: 200))
    puzzleBesarGarisKuningKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
    puzzleBesarGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarGarisKuningKapal.zPosition = 3
    puzzleBesarGarisKuningKapal.alpha = 0
    addChild(puzzleBesarGarisKuningKapal)
    
    puzzleBesarBadanKapalTengah.scale(to: CGSize(width: 708, height: 174))
    puzzleBesarBadanKapalTengah.position = CGPoint(x: size.width/2, y: size.height/2)
    puzzleBesarBadanKapalTengah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalTengah.zPosition = 2
    puzzleBesarBadanKapalTengah.alpha = 0
    addChild(puzzleBesarBadanKapalTengah)
    
    puzzleBesarJendelaBanyakKapal.scale(to: CGSize(width: 531, height: 135))
    puzzleBesarJendelaBanyakKapal.position = CGPoint(x: size.width/2, y: size.height/2)
    puzzleBesarJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaBanyakKapal.zPosition = 2
    puzzleBesarJendelaBanyakKapal.alpha = 0
    addChild(puzzleBesarJendelaBanyakKapal)
    
    puzzleBesarPelampung.scale(to: CGSize(width: 178, height: 164))
    puzzleBesarPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
    puzzleBesarPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarPelampung.zPosition = 5
    puzzleBesarPelampung.alpha = 0
    addChild(puzzleBesarPelampung)
    
    puzzleBesarBulatKapal.scale(to: CGSize(width: 578, height: 177))
    puzzleBesarBulatKapal.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
    puzzleBesarBulatKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBulatKapal.zPosition = 4
    puzzleBesarBulatKapal.alpha = 0
    addChild(puzzleBesarBulatKapal)
    
    puzzleBesarBenderaKapal.scale(to: CGSize(width: 95, height: 155))
    puzzleBesarBenderaKapal.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
    puzzleBesarBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBenderaKapal.zPosition = 3
    puzzleBesarBenderaKapal.alpha = 0
    addChild(puzzleBesarBenderaKapal)
    
    puzzleBesarBadanKapalAtas.scale(to: CGSize(width: 334, height: 189))
    puzzleBesarBadanKapalAtas.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
    puzzleBesarBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapalAtas.zPosition = 2
    puzzleBesarBadanKapalAtas.alpha = 0
    addChild(puzzleBesarBadanKapalAtas)
    
    puzzleBesarJendelaKapal.scale(to: CGSize(width: 125, height: 83))
    puzzleBesarJendelaKapal.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
    puzzleBesarJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaKapal.zPosition = 3
    puzzleBesarJendelaKapal.alpha = 0
    addChild(puzzleBesarJendelaKapal)
    
    puzzleBesarAtapKapal.scale(to: CGSize(width: 401, height: 73))
    puzzleBesarAtapKapal.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
    puzzleBesarAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarAtapKapal.zPosition = 3
    puzzleBesarAtapKapal.alpha = 0
    addChild(puzzleBesarAtapKapal)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      print("\(atPoint(location))")
      if atPoint(touch.location(in: self)).name == puzzleKecilBulatKapal.name {
        if puzzleKecilBulatKapal.position != puzzleBesarBulatKapal.position{
          puzzleKecilBulatKapal.position = location
          puzzleKecilBulatKapal.zPosition = 4
          puzzleKecilBulatKapal.scale(to: CGSize(width: 578, height: 177))
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilAtapKapal.name {
        if puzzleKecilAtapKapal.position != puzzleBesarAtapKapal.position{
          puzzleKecilAtapKapal.position = location
          puzzleKecilAtapKapal.zPosition = 3
          puzzleKecilAtapKapal.scale(to: CGSize(width: 401, height: 73))
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBenderaKapal.name {
        if puzzleKecilBenderaKapal.position != puzzleBesarBenderaKapal.position{
          puzzleKecilBenderaKapal.position = location
          puzzleKecilBenderaKapal.zPosition = 3
          puzzleKecilBenderaKapal.scale(to: CGSize(width: 95, height: 155))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal.name {
        if puzzleKecilJendelaKapal.position != puzzleBesarJendelaKapal.position{
          puzzleKecilJendelaKapal.position = location
          puzzleKecilJendelaKapal.zPosition = 4
          puzzleKecilJendelaKapal.scale(to: CGSize(width: 125, height: 83))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalAtas.name {
        if puzzleKecilBadanKapalAtas.position != puzzleBesarBadanKapalAtas.position{
          puzzleKecilBadanKapalAtas.position = location
          puzzleKecilBadanKapalAtas.zPosition = 3
          puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 334, height: 189))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKuningKapal.name {
        if puzzleKecilGarisKuningKapal.position != puzzleBesarGarisKuningKapal.position{
          puzzleKecilGarisKuningKapal.position = location
          puzzleKecilGarisKuningKapal.zPosition = 5
          puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 1280, height: 200))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalTengah.name {
        if puzzleKecilBadanKapalTengah.position != puzzleBesarBadanKapalTengah.position{
          puzzleKecilBadanKapalTengah.position = location
          puzzleKecilBadanKapalTengah.zPosition = 3
          puzzleKecilBadanKapalTengah.scale(to: CGSize(width: 708, height: 174))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilPelampung.name {
        if puzzleKecilPelampung.position != puzzleBesarPelampung.position{
          puzzleKecilPelampung.position = location
          puzzleKecilPelampung.zPosition = 6
          puzzleKecilPelampung.scale(to: CGSize(width: 178, height: 164))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilJendelaBanyakKapal.name {
        if puzzleKecilJendelaBanyakKapal.position != puzzleBesarJendelaBanyakKapal.position{
          puzzleKecilJendelaBanyakKapal.position = location
          puzzleKecilJendelaBanyakKapal.zPosition = 4
          puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 531, height: 135))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalBawah.name {
        if puzzleKecilBadanKapalBawah.position != puzzleBesarBadanKapalBawah.position{
          puzzleKecilBadanKapalBawah.position = location
          puzzleKecilBadanKapalBawah.zPosition = 3
          puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 1200, height: 420))
        }
      }
      
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if atPoint(touch.location(in: self)).name == puzzleKecilBulatKapal.name {
        if puzzleKecilBulatKapal.frame.intersects(puzzleBesarBulatKapal.frame){
          run(soundSucces)
          puzzleKecilBulatKapal.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
          puzzleKecilBulatKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilBulatKapal.scale(to: CGSize(width: 250, height: 55))
          puzzleKecilBulatKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilAtapKapal.name {
        if puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame){
          run(soundSucces)
          puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
          puzzleKecilAtapKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilAtapKapal.scale(to: CGSize(width: 200, height: 40))
          puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.42)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBenderaKapal.name {
        if puzzleKecilBenderaKapal.frame.intersects(puzzleBesarBenderaKapal.frame){
          run(soundSucces)
          puzzleKecilBenderaKapal.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
          puzzleKecilBenderaKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilBenderaKapal.scale(to: CGSize(width: 40, height: 60))
          puzzleKecilBenderaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.52)
          
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilJendelaKapal.name {
        if puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame){
          run(soundSucces)
          puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
          puzzleKecilJendelaKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilJendelaKapal.scale(to: CGSize(width: 90, height: 60))
          puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.65)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBadanKapalAtas.name {
        if puzzleKecilBadanKapalAtas.frame.intersects(puzzleBesarBadanKapalAtas.frame){
          run(soundSucces)
          puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
          puzzleKecilBadanKapalAtas.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 200, height: 80))
          puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.13, y: size.height/1.82)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilGarisKuningKapal.name {
        if puzzleKecilGarisKuningKapal.frame.intersects(puzzleBesarGarisKuningKapal.frame){
          run(soundSucces)
          puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
          puzzleKecilGarisKuningKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 250, height: 50))
          puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBadanKapalTengah.name {
        if puzzleKecilBadanKapalTengah.frame.intersects(puzzleBesarBadanKapalTengah.frame){
          run(soundSucces)
          puzzleKecilBadanKapalTengah.position = CGPoint(x: size.width/2, y: size.height/2)
          puzzleKecilBadanKapalTengah.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilBadanKapalTengah.scale(to: CGSize(width: 230, height: 70))
          puzzleKecilBadanKapalTengah.position = CGPoint(x: size.width/1.13, y: size.height/2.30)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilPelampung.name {
        if puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame){
          run(soundSucces)
          puzzleKecilPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
          puzzleKecilPelampung.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilPelampung.scale(to: CGSize(width: 70, height: 60))
          puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/2.60)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilJendelaBanyakKapal.name {
        if puzzleKecilJendelaBanyakKapal.frame.intersects(puzzleBesarJendelaBanyakKapal.frame){
          run(soundSucces)
          puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/2, y: size.height/2)
          puzzleKecilJendelaBanyakKapal.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 230, height: 70))
          puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.00)
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBadanKapalBawah.name {
        if puzzleKecilBadanKapalBawah.frame.intersects(puzzleBesarBadanKapalBawah.frame){
          run(soundSucces)
          puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/2.35, y: size.height/2.68)
          puzzleKecilBadanKapalBawah.inputView?.isMultipleTouchEnabled = false
        } else{
          puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 250, height: 90))
          puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.13, y: size.height/3.80)
        }
      }
      
      if puzzleKecilBadanKapalAtas.frame.intersects(puzzleBesarBadanKapalAtas.frame) && puzzleKecilBadanKapalBawah.frame.intersects(puzzleBesarBadanKapalBawah.frame) && puzzleKecilBadanKapalTengah.frame.intersects(puzzleBesarBadanKapalTengah.frame) && puzzleKecilBulatKapal.frame.intersects(puzzleBesarBulatKapal.frame) && puzzleBesarGarisKuningKapal.frame.intersects(puzzleBesarGarisKuningKapal.frame) && puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame) && puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame) && puzzleKecilJendelaBanyakKapal.frame.intersects(puzzleBesarJendelaBanyakKapal.frame) && puzzleKecilBenderaKapal.frame.intersects(puzzleBesarBenderaKapal.frame) && puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame){
          gameFinish()
      } else{
        print("Belum Lengkap")
      }
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //            puzzleKecilBulatKapal.isHidden = true
    CustomScrollView.disable()
    for touch in touches {
      //      CustomScrollView.disable()
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
  }
  
  func buttonTutupSceneAksi() {
    run(clickButton)
    popUpPuzzle.isHidden = true
    buttonTutup.isHidden = true
    backgroundOpacity.isHidden = true
  }
  
  func buttonBackToGame() {
    run(clickButton)
    let reveal = SKTransition.reveal(with: .right, duration: 1)
    let prevScene = MalinKundang_PilihKapal(size: CGSize(width: 2048, height: 1536))
    prevScene.scaleMode = .aspectFill
    scene?.view!.presentScene(prevScene, transition: reveal)
  }
  
  func gameFinish(){
    backgroundOpacity.isHidden = false
    popUpSuksesKapal.isHidden = false
    buttonNextStory.isHidden = false
    buttonReplayGame.isHidden = false
  }
  
  func buttonTanyaAksi(){
    run(clickButton)
    popUpPuzzle.isHidden = false
    buttonTutup.isHidden = false
    backgroundOpacity.isHidden = false
  }
  
  func buttonHomeAksi(){
    run(clickButton)
    if buttonHome.action(forKey: "Button Home") == nil {
      buttonHome.run((buttonHomeAction!), withKey: "Button Home")
        self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
//      let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
//      self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
    }
  }
  
  func buttonNextStoryScene() {
    run(clickButton)
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

