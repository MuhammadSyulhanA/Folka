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
  
  //MARK: PUZZLE KECIL2
  let puzzleKecilBadanKapalAtas2 = SKSpriteNode(imageNamed: "badanKapalAtas")
  let puzzleKecilBulatKapal2 = SKSpriteNode(imageNamed: "bulatTigaKapal")
  let puzzleKecilBadanKapalBawah2 = SKSpriteNode(imageNamed: "badanKapalBawah")
  let puzzleKecilBadanKapalTengah2 = SKSpriteNode(imageNamed: "badanKapalTengah")
  let puzzleKecilGarisKuningKapal2 = SKSpriteNode(imageNamed: "garisKuningKapal")
  let puzzleKecilAtapKapal2 = SKSpriteNode(imageNamed: "atapKapalDua")
  let puzzleKecilJendelaBanyakKapal2 = SKSpriteNode(imageNamed: "jendelaBanyakKapal")
  let puzzleKecilJendelaKapal2 = SKSpriteNode(imageNamed: "jendelaKapalDua")
  let puzzleKecilBenderaKapal2 = SKSpriteNode(imageNamed: "benderaKapal")
  let puzzleKecilPelampung2 = SKSpriteNode(imageNamed: "pelampungKapalDua")
  
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
    
    //
    //        var arrayPuzzleKecil: [SKSpriteNode] = [
    //          puzzleKecilPelampung, puzzleBesarBulatKapal, puzzleKecilBenderaKapal, puzzleKecilGarisKapal, puzzleKecilGarisMerahKapal
    //        ]
    
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
    popUpPuzzle.zPosition = 5
    popUpPuzzle.isHidden = false
    addChild(popUpPuzzle)
    
    popUpSuksesKapal.size = CGSize(width: 1250, height: 820)
    popUpSuksesKapal.name = "failed"
    popUpSuksesKapal.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpSuksesKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpSuksesKapal.zPosition = 5
    popUpSuksesKapal.isHidden = true
    addChild(popUpSuksesKapal)
    
    buttonNextStory.size = CGSize(width: 500, height: 130)
    buttonNextStory.name = "nextStory"
    buttonNextStory.position = CGPoint(x: size.width/1.5, y: size.height/2.8)
    buttonNextStory.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonNextStory.zPosition = 6
    buttonNextStory.isHidden = true
    addChild(buttonNextStory)
    
    buttonReplayGame.size = CGSize(width: 500, height: 130)
    buttonReplayGame.name = "replayGame"
    buttonReplayGame.position = CGPoint(x: size.width/2.9, y: size.height/2.8)
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
    
    
    //MARK: POSISI PUZZLE KECIL PERTAMA
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
    
    buttonHome.size = CGSize(width: 120, height: 120)
    buttonHome.position = CGPoint(x: size.width/16, y: size.height/1.35)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    buttonHome.name = "buttonHome"
    addChild(buttonHome)
    
    buttonTanya.size = CGSize(width: 120, height: 120)
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
    puzzleKecilBulatKapal.scale(to: CGSize(width: 346, height: 107))
    puzzleKecilBulatKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
    puzzleKecilBulatKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBulatKapal.isHidden = false
    puzzleKecilBulatKapal.zPosition = 3
    //    addChild(puzzleKecilBulatKapal)
    
    puzzleKecilAtapKapal.name = "puzzleKecilAtapKapal"
    puzzleKecilAtapKapal.scale(to: CGSize(width: 346, height: 73))
    puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.50)
    puzzleKecilAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilAtapKapal.zPosition = 3
    
    puzzleKecilBenderaKapal.name = "puzzleKecilBenderaKapal"
    puzzleKecilBenderaKapal.scale(to: CGSize(width: 75, height: 108))
    puzzleKecilBenderaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.70)
    puzzleKecilBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBenderaKapal.zPosition = 3
    //    addChild(puzzleKecilBenderaKapal)
    
    puzzleKecilJendelaKapal.name = "puzzleKecilJendelaKapal"
    puzzleKecilJendelaKapal.scale(to: CGSize(width: 160, height: 106))
    puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
    puzzleKecilJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapal.zPosition = 3
    //    addChild(puzzleKecilJendelaKapalAtas)
    
    puzzleKecilBadanKapalAtas.name = "puzzleKecilBadanKapalAtas"
    puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 235, height: 133))
    puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
    puzzleKecilBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalAtas.zPosition = 3
    //    addChild(puzzleKecilBadanKapalAtas)
    
    puzzleKecilGarisKuningKapal.name = "puzzleKecilGarisKuningKapal"
    puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 370, height: 106))
    puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
    puzzleKecilGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKuningKapal.zPosition = 3
    //    addChild(puzzleKecilGarisKapal)
    
    puzzleKecilBadanKapalTengah.name = "puzzleKecilBadanKapalTengah"
    puzzleKecilBadanKapalTengah.scale(to: CGSize(width: 346, height: 106))
    puzzleKecilBadanKapalTengah.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
    puzzleKecilBadanKapalTengah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalTengah.zPosition = 3
    //    addChild(puzzleKecilBadanKapalBiru)
    
    puzzleKecilPelampung.name = "puzzleKecilPelampung"
    puzzleKecilPelampung.scale(to: CGSize(width: 130, height: 130))
    puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/5.55)
    puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 1)
    puzzleKecilPelampung.zPosition = 3
    puzzleKecilPelampung.isHidden = false
    //        addChild(puzzleKecilPelampung)
    
    puzzleKecilJendelaBanyakKapal.name = "puzzleKecilJendelaBanyakKapal"
    puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 351, height: 106))
    puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.13, y: size.height/5.85)
    puzzleKecilJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 2.5)
    puzzleKecilJendelaBanyakKapal.zPosition = 3
    //    addChild(puzzleKecilJendelaBanyakKapal)
    
    puzzleKecilBadanKapalBawah.name = "puzzleKecilBadanKapalBawah"
    puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 350, height: 121))
    puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.13, y: size.height/6.35)
    puzzleKecilBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 3.5)
    puzzleKecilBadanKapalBawah.zPosition = 3
    //    addChild(puzzleKecilBadanKapalBawah)
    
    //MARK: POSISI PUZZLE KECIL KEDUA
    puzzleKecilBulatKapal2.name = "puzzleKecilBulatKapal2"
    puzzleKecilBulatKapal2.scale(to: CGSize(width: 346, height: 107))
    puzzleKecilBulatKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
    puzzleKecilBulatKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBulatKapal2.isHidden = true
    puzzleKecilBulatKapal2.zPosition = 3
    addChild(puzzleKecilBulatKapal2)
    
    puzzleKecilAtapKapal2.name = "puzzleKecilAtapKapal2"
    puzzleKecilAtapKapal2.scale(to: CGSize(width: 346, height: 73))
    puzzleKecilAtapKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.50)
    puzzleKecilAtapKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilAtapKapal2.isHidden = true
    puzzleKecilAtapKapal2.zPosition = 3
    addChild(puzzleKecilAtapKapal2)
    
    puzzleKecilBenderaKapal2.name = "puzzleKecilBenderaKapal2"
    puzzleKecilBenderaKapal2.scale(to: CGSize(width: 75, height: 108))
    puzzleKecilBenderaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.70)
    puzzleKecilBenderaKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBenderaKapal2.zPosition = 3
    puzzleKecilBenderaKapal2.isHidden = true
    addChild(puzzleKecilBenderaKapal2)
    
    puzzleKecilJendelaKapal2.name = "puzzleKecilJendelaKapal2"
    puzzleKecilJendelaKapal2.scale(to: CGSize(width: 160, height: 106))
    puzzleKecilJendelaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
    puzzleKecilJendelaKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapal2.zPosition = 3
    puzzleKecilJendelaKapal2.isHidden = true
    addChild(puzzleKecilJendelaKapal2)
    
    puzzleKecilBadanKapalAtas2.name = "puzzleKecilBadanKapalAtas2"
    puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 235, height: 133))
    puzzleKecilBadanKapalAtas2.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
    puzzleKecilBadanKapalAtas2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalAtas2.zPosition = 3
    puzzleKecilBadanKapalAtas2.isHidden = true
    addChild(puzzleKecilBadanKapalAtas2)
    
    puzzleKecilGarisKuningKapal2.name = "puzzleKecilGarisKuningKapal2"
    puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 370, height: 106))
    puzzleKecilGarisKuningKapal2.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
    puzzleKecilGarisKuningKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKuningKapal2.zPosition = 3
    puzzleKecilGarisKuningKapal2.isHidden = true
    addChild(puzzleKecilGarisKuningKapal2)
    
    puzzleKecilBadanKapalTengah2.name = "puzzleKecilBadanKapalTengah2"
    puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 346, height: 106))
    puzzleKecilBadanKapalTengah2.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
    puzzleKecilBadanKapalTengah2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapalTengah2.zPosition = 3
    puzzleKecilBadanKapalTengah2.isHidden = true
    addChild(puzzleKecilBadanKapalTengah2)
    
    puzzleKecilPelampung2.name = "puzzleKecilPelampung2"
    puzzleKecilPelampung2.scale(to: CGSize(width: 130, height: 130))
    puzzleKecilPelampung2.position = puzzleKecilPelampung.position
    puzzleKecilPelampung2.anchorPoint = CGPoint(x: 0.5, y: 1)
    puzzleKecilPelampung2.zPosition = 3
    puzzleKecilPelampung2.isHidden = true
    addChild(puzzleKecilPelampung2)
    
    puzzleKecilJendelaBanyakKapal2.name = "puzzleKecilJendelaBanyakKapal2"
    puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 351, height: 106))
    puzzleKecilJendelaBanyakKapal2.position = CGPoint(x: size.width/1.13, y: size.height/5.85)
    puzzleKecilJendelaBanyakKapal2.anchorPoint = CGPoint(x: 0.5, y: 2.5)
    puzzleKecilJendelaBanyakKapal2.zPosition = 3
    puzzleKecilJendelaBanyakKapal2.isHidden = true
    addChild(puzzleKecilJendelaBanyakKapal2)
    
    puzzleKecilBadanKapalBawah2.name = "puzzleKecilBadanKapalBawah2"
    puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 350, height: 121))
    puzzleKecilBadanKapalBawah2.position = CGPoint(x: size.width/1.13, y: size.height/6.35)
    puzzleKecilBadanKapalBawah2.anchorPoint = CGPoint(x: 0.5, y: 3.5)
    puzzleKecilBadanKapalBawah2.zPosition = 3
    puzzleKecilBadanKapalBawah2.isHidden = true
    addChild(puzzleKecilBadanKapalBawah2)
    
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
    
    scrollView = CustomScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), scene: self, moveableNode: moveableNode, scrollDirection: .vertical)
    scrollView.contentSize = CGSize(width: 0, height: self.frame.size.height * 1.4)
    view.addSubview(scrollView)
    addChild(moveableNode)
    
    moveableNode.addChild(puzzleKecilPelampung)
    moveableNode.addChild(puzzleKecilGarisKuningKapal)
    moveableNode.addChild(puzzleKecilBenderaKapal)
    moveableNode.addChild(puzzleKecilBadanKapalAtas)
    moveableNode.addChild(puzzleKecilBadanKapalTengah)
    moveableNode.addChild(puzzleKecilAtapKapal)
    moveableNode.addChild(puzzleKecilBulatKapal)
    moveableNode.addChild(puzzleKecilJendelaBanyakKapal)
    moveableNode.addChild(puzzleKecilJendelaKapal)
    moveableNode.addChild(puzzleKecilBadanKapalBawah)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      CustomScrollView.disable()
      let location = touch.location(in: self)
      print("\(atPoint(location))")
      if atPoint(touch.location(in: self)).name == puzzleKecilBulatKapal2.name {
        if puzzleKecilBulatKapal2.position != puzzleBesarBulatKapal.position{
          puzzleKecilBulatKapal2.position = location
          puzzleKecilBulatKapal2.zPosition = 3
          puzzleKecilBulatKapal2.scale(to: CGSize(width: 578, height: 177))
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilAtapKapal2.name {
        if puzzleKecilAtapKapal2.position != puzzleBesarAtapKapal.position{
          puzzleKecilAtapKapal2.position = location
          puzzleKecilAtapKapal2.zPosition = 3
          puzzleKecilAtapKapal2.scale(to: CGSize(width: 401, height: 73))
        }
      }
      
      if atPoint(touch.location(in: self)).name == puzzleKecilBenderaKapal2.name {
        if puzzleKecilBenderaKapal2.position != puzzleBesarBenderaKapal.position{
          puzzleKecilBenderaKapal2.position = location
          puzzleKecilBenderaKapal2.zPosition = 3
          puzzleKecilBenderaKapal2.scale(to: CGSize(width: 95, height: 155))
        }
      }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal2.name {
              if puzzleKecilJendelaKapal2.position != puzzleBesarJendelaKapal.position{
                puzzleKecilJendelaKapal2.position = location
                puzzleKecilJendelaKapal2.zPosition = 3
                puzzleKecilJendelaKapal2.scale(to: CGSize(width: 125, height: 83))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalAtas2.name {
              if puzzleKecilBadanKapalAtas2.position != puzzleBesarBadanKapalAtas.position{
                puzzleKecilBadanKapalAtas2.position = location
                puzzleKecilBadanKapalAtas2.zPosition = 3
                puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 334, height: 189))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilGarisKuningKapal2.name {
              if puzzleKecilGarisKuningKapal2.position != puzzleBesarGarisKuningKapal.position{
                puzzleKecilGarisKuningKapal2.position = location
                puzzleKecilGarisKuningKapal2.zPosition = 3
                puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 1280, height: 200))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalTengah2.name {
              if puzzleKecilBadanKapalTengah2.position != puzzleBesarBadanKapalTengah.position{
                puzzleKecilBadanKapalTengah2.position = location
                puzzleKecilBadanKapalTengah2.zPosition = 3
                puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 708, height: 174))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilPelampung2.name {
              if puzzleKecilPelampung2.position != puzzleBesarPelampung.position{
                puzzleKecilPelampung2.position = location
                puzzleKecilPelampung2.zPosition = 3
                puzzleKecilPelampung2.scale(to: CGSize(width: 178, height: 164))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilJendelaBanyakKapal2.name {
              if puzzleKecilJendelaBanyakKapal2.position != puzzleBesarJendelaBanyakKapal.position{
                puzzleKecilJendelaBanyakKapal2.position = location
                puzzleKecilJendelaBanyakKapal2.zPosition = 3
                puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 531, height: 135))
              }
            }
      
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalBawah2.name {
              if puzzleKecilBadanKapalBawah2.position != puzzleBesarBadanKapalBawah.position{
                puzzleKecilBadanKapalBawah2.position = location
                puzzleKecilBadanKapalBawah2.zPosition = 3
                puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 1200, height: 420))
              }
            }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    CustomScrollView.enable()
    
    for touch in touches {
      if puzzleKecilBulatKapal2.frame.intersects(puzzleBesarBulatKapal.frame){
        puzzleKecilBulatKapal2.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
        puzzleKecilBulatKapal2.isUserInteractionEnabled = true
      } else{
        puzzleKecilBulatKapal2.isHidden = true
        puzzleKecilBulatKapal.isHidden = false
        puzzleKecilBulatKapal.zPosition = 3
        //    addChild(puzzleKecilBulatKapal)
        
        puzzleKecilAtapKapal.name = "puzzleKecilAtapKapal"
        puzzleKecilAtapKapal.scale(to: CGSize(width: 346, height: 73))
        puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.50)
        puzzleKecilAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilAtapKapal.zPosition = 3
        
        puzzleKecilBenderaKapal.name = "puzzleKecilBenderaKapal"
        puzzleKecilBenderaKapal.scale(to: CGSize(width: 75, height: 108))
        puzzleKecilBenderaKapal.position = CGPoint(x: size.width/1.13, y: size.height/1.70)
        puzzleKecilBenderaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBenderaKapal.zPosition = 3
        //    addChild(puzzleKecilBenderaKapal)
        
        puzzleKecilJendelaKapal.name = "puzzleKecilJendelaKapal"
        puzzleKecilJendelaKapal.scale(to: CGSize(width: 160, height: 106))
        puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
        puzzleKecilJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilJendelaKapal.zPosition = 3
        //    addChild(puzzleKecilJendelaKapalAtas)
        
        puzzleKecilBadanKapalAtas.name = "puzzleKecilBadanKapalAtas"
        puzzleKecilBadanKapalAtas.scale(to: CGSize(width: 235, height: 133))
        puzzleKecilBadanKapalAtas.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
        puzzleKecilBadanKapalAtas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBadanKapalAtas.zPosition = 3
        //    addChild(puzzleKecilBadanKapalAtas)
        
        puzzleKecilGarisKuningKapal.name = "puzzleKecilGarisKuningKapal"
        puzzleKecilGarisKuningKapal.scale(to: CGSize(width: 370, height: 106))
        puzzleKecilGarisKuningKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
        puzzleKecilGarisKuningKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilGarisKuningKapal.zPosition = 3
        //    addChild(puzzleKecilGarisKapal)
        
        puzzleKecilBadanKapalTengah.name = "puzzleKecilBadanKapalTengah"
        puzzleKecilBadanKapalTengah.scale(to: CGSize(width: 346, height: 106))
        puzzleKecilBadanKapalTengah.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
        puzzleKecilBadanKapalTengah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBadanKapalTengah.zPosition = 3
        //    addChild(puzzleKecilBadanKapalBiru)
        
        puzzleKecilPelampung.name = "puzzleKecilPelampung"
        puzzleKecilPelampung.scale(to: CGSize(width: 130, height: 130))
        puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/5.55)
        puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 1)
        puzzleKecilPelampung.zPosition = 3
        puzzleKecilPelampung.isHidden = false
        //        addChild(puzzleKecilPelampung)
        
        puzzleKecilJendelaBanyakKapal.name = "puzzleKecilJendelaBanyakKapal"
        puzzleKecilJendelaBanyakKapal.scale(to: CGSize(width: 351, height: 106))
        puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.13, y: size.height/5.85)
        puzzleKecilJendelaBanyakKapal.anchorPoint = CGPoint(x: 0.5, y: 2.5)
        puzzleKecilJendelaBanyakKapal.zPosition = 3
        //    addChild(puzzleKecilJendelaBanyakKapal)
        
        puzzleKecilBadanKapalBawah.name = "puzzleKecilBadanKapalBawah"
        puzzleKecilBadanKapalBawah.scale(to: CGSize(width: 350, height: 121))
        puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.13, y: size.height/6.35)
        puzzleKecilBadanKapalBawah.anchorPoint = CGPoint(x: 0.5, y: 3.5)
        puzzleKecilBadanKapalBawah.zPosition = 3
        //    addChild(puzzleKecilBadanKapalBawah)
        
        //MARK: POSISI PUZZLE KECIL KEDUA
        puzzleKecilBulatKapal2.name = "puzzleKecilBulatKapal2"
        puzzleKecilBulatKapal2.scale(to: CGSize(width: 346, height: 107))
        puzzleKecilBulatKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
        puzzleKecilBulatKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBulatKapal2.isHidden = true
        puzzleKecilBulatKapal2.zPosition = 3
        addChild(puzzleKecilBulatKapal2)
        
        puzzleKecilAtapKapal2.name = "puzzleKecilAtapKapal2"
        puzzleKecilAtapKapal2.scale(to: CGSize(width: 346, height: 73))
        puzzleKecilAtapKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.50)
        puzzleKecilAtapKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilAtapKapal2.isHidden = true
        puzzleKecilAtapKapal2.zPosition = 3
        addChild(puzzleKecilAtapKapal2)
        
        puzzleKecilBenderaKapal2.name = "puzzleKecilBenderaKapal2"
        puzzleKecilBenderaKapal2.scale(to: CGSize(width: 75, height: 108))
        puzzleKecilBenderaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.70)
        puzzleKecilBenderaKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBenderaKapal2.zPosition = 3
        puzzleKecilBenderaKapal2.isHidden = true
        addChild(puzzleKecilBenderaKapal2)
        
        puzzleKecilJendelaKapal2.name = "puzzleKecilJendelaKapal2"
        puzzleKecilJendelaKapal2.scale(to: CGSize(width: 160, height: 106))
        puzzleKecilJendelaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
        puzzleKecilJendelaKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilJendelaKapal2.zPosition = 3
        puzzleKecilJendelaKapal2.isHidden = true
        addChild(puzzleKecilJendelaKapal2)
        
        puzzleKecilBadanKapalAtas2.name = "puzzleKecilBadanKapalAtas2"
        puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 235, height: 133))
        puzzleKecilBadanKapalAtas2.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
        puzzleKecilBadanKapalAtas2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBadanKapalAtas2.zPosition = 3
        puzzleKecilBadanKapalAtas2.isHidden = true
        addChild(puzzleKecilBadanKapalAtas2)
        
        puzzleKecilGarisKuningKapal2.name = "puzzleKecilGarisKuningKapal2"
        puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 370, height: 106))
        puzzleKecilGarisKuningKapal2.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
        puzzleKecilGarisKuningKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilGarisKuningKapal2.zPosition = 3
        puzzleKecilGarisKuningKapal2.isHidden = true
        addChild(puzzleKecilGarisKuningKapal2)
        
        puzzleKecilBadanKapalTengah2.name = "puzzleKecilBadanKapalTengah2"
        puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 346, height: 106))
        puzzleKecilBadanKapalTengah2.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
        puzzleKecilBadanKapalTengah2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puzzleKecilBadanKapalTengah2.zPosition = 3
        puzzleKecilBadanKapalTengah2.isHidden = true
        addChild(puzzleKecilBadanKapalTengah2)
        
        puzzleKecilPelampung2.name = "puzzleKecilPelampung2"
        puzzleKecilPelampung2.scale(to: CGSize(width: 130, height: 130))
        puzzleKecilPelampung2.position = puzzleKecilPelampung.position
        puzzleKecilPelampung2.anchorPoint = CGPoint(x: 0.5, y: 1)
        puzzleKecilPelampung2.zPosition = 3
        puzzleKecilPelampung2.isHidden = true
        addChild(puzzleKecilPelampung2)
        
        puzzleKecilJendelaBanyakKapal2.name = "puzzleKecilJendelaBanyakKapal2"
        puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 351, height: 106))
        puzzleKecilJendelaBanyakKapal2.position = CGPoint(x: size.width/1.13, y: size.height/5.85)
        puzzleKecilJendelaBanyakKapal2.anchorPoint = CGPoint(x: 0.5, y: 2.5)
        puzzleKecilJendelaBanyakKapal2.zPosition = 3
        puzzleKecilJendelaBanyakKapal2.isHidden = true
        addChild(puzzleKecilJendelaBanyakKapal2)
        
        puzzleKecilBadanKapalBawah2.name = "puzzleKecilBadanKapalBawah2"
        puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 350, height: 121))
        puzzleKecilBadanKapalBawah2.position = CGPoint(x: size.width/1.13, y: size.height/6.35)
        puzzleKecilBadanKapalBawah2.anchorPoint = CGPoint(x: 0.5, y: 3.5)
        puzzleKecilBadanKapalBawah2.zPosition = 3
        puzzleKecilBadanKapalBawah2.isHidden = true
        addChild(puzzleKecilBadanKapalBawah2)
        
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
        
        scrollView = CustomScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), scene: self, moveableNode: moveableNode, scrollDirection: .vertical)
        scrollView.contentSize = CGSize(width: 0, height: self.frame.size.height * 1.4)
        view.addSubview(scrollView)
        addChild(moveableNode)
        
        moveableNode.addChild(puzzleKecilPelampung)
        moveableNode.addChild(puzzleKecilGarisKuningKapal)
        moveableNode.addChild(puzzleKecilBenderaKapal)
        moveableNode.addChild(puzzleKecilBadanKapalAtas)
        moveableNode.addChild(puzzleKecilBadanKapalTengah)
        moveableNode.addChild(puzzleKecilAtapKapal)
        moveableNode.addChild(puzzleKecilBulatKapal)
        moveableNode.addChild(puzzleKecilJendelaBanyakKapal)
        moveableNode.addChild(puzzleKecilJendelaKapal)
        moveableNode.addChild(puzzleKecilBadanKapalBawah)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            CustomScrollView.disable()
            let location = touch.location(in: self)
            print("\(atPoint(location))")
            if atPoint(touch.location(in: self)).name == puzzleKecilBulatKapal2.name {
                if puzzleKecilBulatKapal2.position != puzzleBesarBulatKapal.position{
                    puzzleKecilBulatKapal2.position = location
                    puzzleKecilBulatKapal2.zPosition = 3
                    puzzleKecilBulatKapal2.scale(to: CGSize(width: 578, height: 177))
                }
            }
            
            if atPoint(touch.location(in: self)).name == puzzleKecilAtapKapal2.name {
                if puzzleKecilAtapKapal2.position != puzzleBesarAtapKapal.position{
                    puzzleKecilAtapKapal2.position = location
                    puzzleKecilAtapKapal2.zPosition = 3
                    puzzleKecilAtapKapal2.scale(to: CGSize(width: 401, height: 73))
                }
            }
            
            if atPoint(touch.location(in: self)).name == puzzleKecilBenderaKapal2.name {
                if puzzleKecilBenderaKapal2.position != puzzleBesarBenderaKapal.position{
                    puzzleKecilBenderaKapal2.position = location
                    puzzleKecilBenderaKapal2.zPosition = 3
                    puzzleKecilBenderaKapal2.scale(to: CGSize(width: 95, height: 155))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal2.name {
                if puzzleKecilJendelaKapal2.position != puzzleBesarJendelaKapal.position{
                    puzzleKecilJendelaKapal2.position = location
                    puzzleKecilJendelaKapal2.zPosition = 3
                    puzzleKecilJendelaKapal2.scale(to: CGSize(width: 125, height: 83))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalAtas2.name {
                if puzzleKecilBadanKapalAtas2.position != puzzleBesarBadanKapalAtas.position{
                    puzzleKecilBadanKapalAtas2.position = location
                    puzzleKecilBadanKapalAtas2.zPosition = 3
                    puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 334, height: 189))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilGarisKuningKapal2.name {
                if puzzleKecilGarisKuningKapal2.position != puzzleBesarGarisKuningKapal.position{
                    puzzleKecilGarisKuningKapal2.position = location
                    puzzleKecilGarisKuningKapal2.zPosition = 3
                    puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 1280, height: 200))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalTengah2.name {
                if puzzleKecilBadanKapalTengah2.position != puzzleBesarBadanKapalTengah.position{
                    puzzleKecilBadanKapalTengah2.position = location
                    puzzleKecilBadanKapalTengah2.zPosition = 3
                    puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 708, height: 174))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilPelampung2.name {
                if puzzleKecilPelampung2.position != puzzleBesarPelampung.position{
                    puzzleKecilPelampung2.position = location
                    puzzleKecilPelampung2.zPosition = 3
                    puzzleKecilPelampung2.scale(to: CGSize(width: 178, height: 164))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilJendelaBanyakKapal2.name {
                if puzzleKecilJendelaBanyakKapal2.position != puzzleBesarJendelaBanyakKapal.position{
                    puzzleKecilJendelaBanyakKapal2.position = location
                    puzzleKecilJendelaBanyakKapal2.zPosition = 3
                    puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 531, height: 135))
                }
            }
            
            if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapalBawah2.name {
                if puzzleKecilBadanKapalBawah2.position != puzzleBesarBadanKapalBawah.position{
                    puzzleKecilBadanKapalBawah2.position = location
                    puzzleKecilBadanKapalBawah2.zPosition = 3
                    puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 1200, height: 420))
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        CustomScrollView.enable()
        
        for touch in touches {
            if puzzleKecilBulatKapal2.frame.intersects(puzzleBesarBulatKapal.frame){
                puzzleKecilBulatKapal2.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
                puzzleKecilBulatKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilBulatKapal2.isHidden = true
                puzzleKecilBulatKapal.isHidden = false
                puzzleKecilBulatKapal2.scale(to: CGSize(width: 346, height: 107))
                puzzleKecilBulatKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
            }
            
            if puzzleKecilAtapKapal2.frame.intersects(puzzleBesarAtapKapal.frame){
                puzzleKecilAtapKapal2.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
                puzzleKecilAtapKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilAtapKapal2.isHidden = true
                puzzleKecilAtapKapal.isHidden = false
                puzzleKecilAtapKapal2.scale(to: CGSize(width: 346, height: 106))
                puzzleKecilAtapKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.50)
            }
            
            if puzzleKecilBenderaKapal2.frame.intersects(puzzleBesarBenderaKapal.frame){
                puzzleKecilBenderaKapal2.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
                puzzleKecilBenderaKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilBenderaKapal2.isHidden = true
                puzzleKecilBenderaKapal.isHidden = false
                puzzleKecilBenderaKapal2.scale(to: CGSize(width: 75, height: 108))
                puzzleKecilBenderaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/1.70)
            }
            
            
            if puzzleKecilJendelaKapal2.frame.intersects(puzzleBesarJendelaKapal.frame){
                puzzleKecilJendelaKapal2.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
                puzzleKecilJendelaKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilJendelaKapal2.isHidden = true
                puzzleKecilJendelaKapal.isHidden = false
                puzzleKecilJendelaKapal2.scale(to: CGSize(width: 160, height: 106))
                puzzleKecilJendelaKapal2.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
            }
            
            if puzzleKecilBadanKapalAtas2.frame.intersects(puzzleBesarBadanKapalAtas.frame){
                puzzleKecilBadanKapalAtas2.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
                puzzleKecilBadanKapalAtas2.isUserInteractionEnabled = true
            } else{
                puzzleKecilBadanKapalAtas2.isHidden = true
                puzzleKecilBadanKapalAtas.isHidden = false
                puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 235, height: 133))
                puzzleKecilBadanKapalAtas2.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
                
            }
            
            if puzzleKecilGarisKuningKapal2.frame.intersects(puzzleBesarGarisKuningKapal.frame){
                puzzleKecilGarisKuningKapal2.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
                puzzleKecilGarisKuningKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilGarisKuningKapal2.isHidden = true
                puzzleKecilGarisKuningKapal.isHidden = false
                puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 370, height: 106))
                puzzleKecilGarisKuningKapal2.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
                
            }
            
            if puzzleKecilBadanKapalTengah2.frame.intersects(puzzleBesarBadanKapalTengah.frame){
                puzzleKecilBadanKapalTengah2.position = CGPoint(x: size.width/2, y: size.height/2)
                puzzleKecilBadanKapalTengah2.isUserInteractionEnabled = true
            } else{
                puzzleKecilBadanKapalTengah2.isHidden = true
                puzzleKecilBadanKapalTengah.isHidden = false
                puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 346, height: 106))
                puzzleKecilBadanKapalTengah2.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
                
            }
            
            if puzzleKecilPelampung2.frame.intersects(puzzleBesarPelampung.frame){
                puzzleKecilPelampung2.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
                puzzleKecilPelampung2.isUserInteractionEnabled = true
            } else{
                puzzleKecilPelampung2.isHidden = true
                puzzleKecilPelampung.isHidden = false
                puzzleKecilPelampung2.scale(to: CGSize(width: 130, height: 130))
                puzzleKecilPelampung2.position = CGPoint(x: size.width/1.13, y: size.height/5.55)
                
            }
            
            if puzzleKecilJendelaBanyakKapal2.frame.intersects(puzzleBesarJendelaBanyakKapal.frame){
                puzzleKecilJendelaBanyakKapal2.position = CGPoint(x: size.width/2, y: size.height/2)
                puzzleKecilJendelaBanyakKapal2.isUserInteractionEnabled = true
            } else{
                puzzleKecilJendelaBanyakKapal2.isHidden = true
                puzzleKecilJendelaBanyakKapal.isHidden = false
                puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 351, height: 106))
                puzzleKecilJendelaBanyakKapal2.position = CGPoint(x: size.width/1.13, y: size.height/5.85)
                
            }
            
            if puzzleKecilBadanKapalBawah2.frame.intersects(puzzleBesarBadanKapalBawah.frame){
                puzzleKecilBadanKapalBawah2.position = CGPoint(x: size.width/2.35, y: size.height/2.68)
                puzzleKecilBadanKapalBawah2.isUserInteractionEnabled = true
            } else{
                puzzleKecilBadanKapalBawah2.isHidden = true
                puzzleKecilBadanKapalBawah.isHidden = false
                puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 350, height: 121))
                puzzleKecilBadanKapalBawah2.position = CGPoint(x: size.width/1.13, y: size.height/6.35)
                
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //            puzzleKecilBulatKapal2.isHidden = true
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
            
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilBulatKapal.name {
                if puzzleKecilBulatKapal2.position != puzzleBesarBulatKapal.position{
                    puzzleKecilBulatKapal.isHidden = true
                    puzzleKecilBulatKapal2.isHidden = false
                    puzzleKecilBulatKapal2.zPosition = 3
                    puzzleKecilBulatKapal2.scale(to: CGSize(width: 578, height: 177))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilAtapKapal.name {
                if puzzleKecilAtapKapal2.position != puzzleBesarAtapKapal.position{
                    puzzleKecilAtapKapal.isHidden = true
                    puzzleKecilAtapKapal2.isHidden = false
                    puzzleKecilAtapKapal2.zPosition = 3
                    //          puzzleKecilAtapKapal2.scale(to: CGSize(width: 401, height: 73))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilBenderaKapal.name {
                if puzzleKecilBenderaKapal2.position != puzzleBesarBenderaKapal.position{
                    puzzleKecilBenderaKapal.isHidden = true
                    puzzleKecilBenderaKapal2.isHidden = false
                    puzzleKecilBenderaKapal2.zPosition = 3
                    puzzleKecilBenderaKapal2.scale(to: CGSize(width: 95, height: 155))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilJendelaKapal.name {
                if puzzleKecilJendelaKapal2.position != puzzleBesarJendelaKapal.position{
                    puzzleKecilJendelaKapal.isHidden = true
                    puzzleKecilJendelaKapal2.isHidden = false
                    puzzleKecilJendelaKapal2.zPosition = 3
                    puzzleKecilJendelaKapal2.scale(to: CGSize(width: 125, height: 83))
                }
            }
            
            //DARI SINI
            if atPoint((touch?.location(in: self))!).name == puzzleKecilBadanKapalAtas.name {
                if puzzleKecilBadanKapalAtas2.position != puzzleBesarBadanKapalAtas.position{
                    puzzleKecilBadanKapalAtas.isHidden = true
                    puzzleKecilBadanKapalAtas2.isHidden = false
                    puzzleKecilBadanKapalAtas2.zPosition = 3
                    puzzleKecilBadanKapalAtas2.scale(to: CGSize(width: 334, height: 189))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilGarisKuningKapal.name {
                if puzzleKecilGarisKuningKapal2.position != puzzleBesarGarisKuningKapal.position{
                    puzzleKecilGarisKuningKapal.isHidden = true
                    puzzleKecilGarisKuningKapal2.isHidden = false
                    puzzleKecilGarisKuningKapal2.zPosition = 3
                    puzzleKecilGarisKuningKapal2.scale(to: CGSize(width: 1280, height: 200))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilBadanKapalTengah.name {
                if puzzleKecilBadanKapalTengah2.position != puzzleBesarBadanKapalTengah.position{
                    puzzleKecilBadanKapalTengah.isHidden = true
                    puzzleKecilBadanKapalTengah2.isHidden = false
                    puzzleKecilBadanKapalTengah2.zPosition = 3
                    puzzleKecilBadanKapalTengah2.scale(to: CGSize(width: 708, height: 174))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilPelampung.name {
                if puzzleKecilPelampung2.position != puzzleBesarPelampung.position{
                    puzzleKecilPelampung.isHidden = true
                    puzzleKecilPelampung2.isHidden = false
                    puzzleKecilPelampung2.zPosition = 3
                    puzzleKecilPelampung.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
                    puzzleKecilPelampung2.scale(to: CGSize(width: 178, height: 164))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilJendelaBanyakKapal.name {
                if puzzleKecilJendelaBanyakKapal2.position != puzzleBesarJendelaBanyakKapal.position{
                    puzzleKecilJendelaBanyakKapal.isHidden = true
                    puzzleKecilJendelaBanyakKapal2.isHidden = false
                    puzzleKecilJendelaBanyakKapal2.zPosition = 3
                    puzzleKecilJendelaBanyakKapal.position = CGPoint(x: size.width/1.13, y: size.height/3.25)
                    puzzleKecilJendelaBanyakKapal2.scale(to: CGSize(width: 531, height: 135))
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == puzzleKecilBadanKapalBawah.name {
                if puzzleKecilBadanKapalBawah2.position != puzzleBesarBadanKapalBawah.position{
                    puzzleKecilBadanKapalBawah.isHidden = true
                    puzzleKecilBadanKapalBawah2.isHidden = false
                    puzzleKecilBadanKapalBawah2.zPosition = 3
                    puzzleKecilBadanKapalBawah.position = CGPoint(x: size.width/1.13, y: size.height/4.45)
                    puzzleKecilBadanKapalBawah2.scale(to: CGSize(width: 1200, height: 420))
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
        run(clickButton)
        popUpPuzzle.isHidden = false
        buttonTutup.isHidden = false
        backgroundOpacity.isHidden = false
    }
    
    func buttonHomeAksi(){
        run(clickButton)
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
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
