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
import AVFoundation

class MalinKundang_Puzzle2: SKScene{
  //MARK: Pop Up
  let popUpStart = SKSpriteNode(imageNamed: "popUpPuzzleDua")
  let popUpFinish = SKSpriteNode(imageNamed: "popUpSuksesKapalDua")
  
  //MARK: Background
  let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
  let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
  
  //MARK: Button
  let buttonClose = SKSpriteNode(imageNamed: "buttonTutup")
  let buttonCloseAction: SKAction?
  let buttonNextStory = SKSpriteNode(imageNamed: "buttonLanjutkanCeritaPuzzle")
  var buttonNextStoryAction: SKAction?
  let buttonReplayGame = SKSpriteNode(imageNamed: "buttonMainLagiPuzzle")
  var buttonReplayAction: SKAction?
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  let buttonHomeAction: SKAction?
  let buttonQuestion = SKSpriteNode(imageNamed: "buttonTanya")
  let buttonQuestionAction: SKAction?
  
  //MARK: Non Character
  let nonCharacterWoodPuzzle = SKSpriteNode(imageNamed: "kayuPuzzle")
  let nonCharacterOutlineShip = SKSpriteNode(imageNamed: "outlineKapalPuzzleSatu")
  
  //MARK: Small Puzzles
  let smallHullPuzzle = SKSpriteNode(imageNamed: "badanKapal")
  let smallShipRoofPuzzle = SKSpriteNode(imageNamed: "atapKapalMerah")
  let smallFrontHullPuzzle = SKSpriteNode(imageNamed: "badanKapalDepan")
  let smallRearHullPuzzle = SKSpriteNode(imageNamed: "badanKapalBelakang")
  let smallShipYellowLinePuzzle = SKSpriteNode(imageNamed: "garisKuningKapal")
  let smallShipWindowPuzzle = SKSpriteNode(imageNamed: "jendelaKapal")
  let smallLifebuoyPuzzle = SKSpriteNode(imageNamed: "pelampungKapal")
  
  //MARK: Big Puzzles
  let bigHullPuzzle = SKSpriteNode(imageNamed: "badanKapal")
  let bigShipRoofPuzzle = SKSpriteNode(imageNamed: "atapKapalMerah")
  let bigFrontHullPuzzle = SKSpriteNode(imageNamed: "badanKapalDepan")
  let bigRearHullPuzzle = SKSpriteNode(imageNamed: "badanKapalBelakang")
  let bigShipYellowLinePuzzle = SKSpriteNode(imageNamed: "garisKuningKapal")
  let bigShipWindowPuzzle = SKSpriteNode(imageNamed: "jendelaKapal")
  let bigLifebuoyPuzzle = SKSpriteNode(imageNamed: "pelampungKapal")
  
  //MARK: Sound and Music
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  var soundSucces: SKAction = SKAction.playSoundFileNamed("soundSucces", waitForCompletion: true)
  var soundFailed: SKAction = SKAction.playSoundFileNamed("soundFailed", waitForCompletion: true)
  
  //MARK: Animation
  
  override init(size: CGSize){
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    buttonCloseAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonQuestionAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonReplayAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonNextStoryAction = SKAction.sequence([buttonToSmall, buttonToBig])
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func didMove(to view: SKView) {
    //MARK: Background
    self.backgroundColor = SKColor.white
    backgroundOpacity.size = CGSize(width: 2050, height: 1120)
    backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundOpacity.zPosition = 4
    backgroundOpacity.isHidden = false
    addChild(backgroundOpacity)
    
    background.size = CGSize(width: 2040, height: 1120)
    background.position = CGPoint(x: size.width/2, y: size.height/2)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.zPosition = -1
    addChild(background)
    
    //MARK: Pop Up
    popUpStart.size = CGSize(width: 1250, height: 820)
    popUpStart.name = "failed"
    popUpStart.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpStart.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpStart.zPosition = 5
    popUpStart.isHidden = false
    addChild(popUpStart)
    
    popUpFinish.size = CGSize(width: 1250, height: 820)
    popUpFinish.name = "failed"
    popUpFinish.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
    popUpFinish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    popUpFinish.zPosition = 5
    popUpFinish.isHidden = true
    addChild(popUpFinish)
    
    //MARK: Button
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
    
    buttonClose.size = CGSize(width: 580, height: 130)
    buttonClose.name = "buttonTutup"
    buttonClose.position = CGPoint(x: size.width/2, y: size.height/3.4)
    buttonClose.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonClose.zPosition = 6
    buttonClose.isHidden = false
    addChild( buttonClose)
    
    buttonHome.size = CGSize(width: 150, height: 150)
    buttonHome.position = CGPoint(x: size.width/17, y: size.height/1.28)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    buttonHome.name = "buttonHome"
    addChild(buttonHome)
    
    buttonQuestion.size = CGSize(width: 150, height: 150)
    buttonQuestion.position = CGPoint(x: size.width/17, y: size.height/1.48)
    buttonQuestion.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonQuestion.zPosition = 2
    buttonQuestion.name = "buttonTanya"
    addChild(buttonQuestion)
    
    //MARK: Non Character
    nonCharacterOutlineShip.size = CGSize(width: 1346, height: 634)
    nonCharacterOutlineShip.position = CGPoint(x: size.width/2.308, y: size.height/2.2)
    nonCharacterOutlineShip.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterOutlineShip.zPosition = 2
    addChild(nonCharacterOutlineShip)
    
    nonCharacterWoodPuzzle.scale(to: CGSize(width: 390, height: 1000))
    nonCharacterWoodPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2)
    nonCharacterWoodPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterWoodPuzzle.zPosition = 1
    addChild(nonCharacterWoodPuzzle)
    
    //MARK: Small Puzzles Position
    smallHullPuzzle.name = "puzzleKecilBadanKapal"
    smallHullPuzzle.scale(to: CGSize(width: 320, height: 100))
    smallHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
    smallHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallHullPuzzle.shadowedBitMask = 1
    smallHullPuzzle.zPosition = 3
    addChild(smallHullPuzzle)
    
    smallLifebuoyPuzzle.name = "puzzleKecilPelampung"
    smallLifebuoyPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
    smallLifebuoyPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallLifebuoyPuzzle.zPosition = 3
    addChild(smallLifebuoyPuzzle)
    
    smallRearHullPuzzle.name = "puzzleKecilBadanAtasKapal2"
    smallRearHullPuzzle.scale(to: CGSize(width: 230, height: 90))
    smallRearHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
    smallRearHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallRearHullPuzzle.zPosition = 3
    addChild(smallRearHullPuzzle)
    
    smallFrontHullPuzzle.name = "puzzleKecilBadanAtasKapal1"
    smallFrontHullPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallFrontHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
    smallFrontHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallFrontHullPuzzle.zPosition = 3
    addChild(smallFrontHullPuzzle)
    
    smallShipRoofPuzzle.name = "puzzleKecilAtapKapal"
    smallShipRoofPuzzle.scale(to: CGSize(width: 230, height: 60))
    smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
    smallShipRoofPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipRoofPuzzle.zPosition = 3
    addChild(smallShipRoofPuzzle)
    
    smallShipWindowPuzzle.name = "puzzleKecilJendelaKapal"
    smallShipWindowPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
    smallShipWindowPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipWindowPuzzle.zPosition = 3
    addChild(smallShipWindowPuzzle)
    
    smallShipYellowLinePuzzle.name = "puzzleKecilGarisKapal"
    smallShipYellowLinePuzzle.scale(to: CGSize(width: 350, height: 70))
    smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
    smallShipYellowLinePuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipYellowLinePuzzle.zPosition = 3
    addChild(smallShipYellowLinePuzzle)
    
    //MARK: Big Puzzles Position
    bigHullPuzzle.scale(to: CGSize(width: 1213, height: 391))
    bigHullPuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
    bigHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigHullPuzzle.alpha = 0
    bigHullPuzzle.zPosition = 2
    addChild(bigHullPuzzle)
    
    bigShipYellowLinePuzzle.scale(to: CGSize(width: 1354, height: 227))
    bigShipYellowLinePuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
    bigShipYellowLinePuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigShipYellowLinePuzzle.zPosition = 2
    bigShipYellowLinePuzzle.alpha = 0
    addChild(bigShipYellowLinePuzzle)
    
    bigLifebuoyPuzzle.scale(to: CGSize(width: 248, height: 108))
    bigLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
    bigLifebuoyPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigLifebuoyPuzzle.zPosition = 4
    bigLifebuoyPuzzle.alpha = 0
    addChild(bigLifebuoyPuzzle)
    
    bigRearHullPuzzle.scale(to: CGSize(width: 362, height: 135))
    bigRearHullPuzzle.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
    bigRearHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigRearHullPuzzle.zPosition = 2
    bigRearHullPuzzle.alpha = 0
    addChild(bigRearHullPuzzle)
    
    bigFrontHullPuzzle.scale(to: CGSize(width: 446, height: 253))
    bigFrontHullPuzzle.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
    bigFrontHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigFrontHullPuzzle.zPosition = 2
    bigFrontHullPuzzle.alpha = 0
    addChild(bigFrontHullPuzzle)
    
    bigShipRoofPuzzle.scale(to: CGSize(width: 375, height: 94))
    bigShipRoofPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
    bigShipRoofPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigShipRoofPuzzle.zPosition = 3
    bigShipRoofPuzzle.alpha = 0
    addChild(bigShipRoofPuzzle)
    
    bigShipWindowPuzzle.scale(to: CGSize(width: 246, height: 135))
    bigShipWindowPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
    bigShipWindowPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    bigShipWindowPuzzle.zPosition = 1
    bigShipWindowPuzzle.alpha = 0
    addChild(bigShipWindowPuzzle)
    
    //MARK: Sound
    Sound.sharedInstance.playBacksound(file: "ikanPuzzle", fileExtension: "wav")
  }
  
  //MARK: Touches
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      if atPoint((touch.location(in: self))).name == smallHullPuzzle.name {
        if smallHullPuzzle.position != bigHullPuzzle.position{
          smallHullPuzzle.position = location
          smallHullPuzzle.inputView?.isMultipleTouchEnabled = false
          smallHullPuzzle.zPosition = 2
          smallHullPuzzle.scale(to: CGSize(width: 1213, height: 391))
        }
      }
      
      if atPoint((touch.location(in: self))).name == smallLifebuoyPuzzle.name {
        if smallLifebuoyPuzzle.position != bigLifebuoyPuzzle.position{
          smallLifebuoyPuzzle.position = location
          smallLifebuoyPuzzle.zPosition = 4
          smallLifebuoyPuzzle.inputView?.isMultipleTouchEnabled = false
          smallLifebuoyPuzzle.scale(to: CGSize(width: 248, height: 108))
        }
      }
      
      
      if atPoint((touch.location(in: self))).name == smallShipRoofPuzzle.name {
        if smallShipRoofPuzzle.position != bigShipRoofPuzzle.position{
          smallShipRoofPuzzle.position = location
          smallShipRoofPuzzle.zPosition = 4
          smallShipRoofPuzzle.inputView?.isMultipleTouchEnabled = false
          smallShipRoofPuzzle.scale(to: CGSize(width: 375, height: 94))
        }
      }
      
      if atPoint((touch.location(in: self))).name == smallShipYellowLinePuzzle.name {
        if smallShipYellowLinePuzzle.position != bigShipYellowLinePuzzle.position{
          smallShipYellowLinePuzzle.position = location
          smallShipYellowLinePuzzle.inputView?.isMultipleTouchEnabled = false
          smallShipYellowLinePuzzle.zPosition = 3
          smallShipYellowLinePuzzle.scale(to: CGSize(width: 1354, height: 227))
        }
      }
      
      
      if atPoint((touch.location(in: self))).name == smallFrontHullPuzzle.name {
        if smallFrontHullPuzzle.position != bigFrontHullPuzzle.position{
          smallFrontHullPuzzle.position = location
          smallFrontHullPuzzle.inputView?.isMultipleTouchEnabled = false
          smallFrontHullPuzzle.zPosition = 3
          smallFrontHullPuzzle.scale(to: CGSize(width: 446, height: 253))
        }
      }
      
      if atPoint((touch.location(in: self))).name == smallRearHullPuzzle.name {
        if smallRearHullPuzzle.position != bigRearHullPuzzle.position{
          smallRearHullPuzzle.position = location
          smallRearHullPuzzle.inputView?.isMultipleTouchEnabled = false
          smallRearHullPuzzle.zPosition = 3
          smallRearHullPuzzle.scale(to: CGSize(width: 362, height: 135))
        }
      }
      
      if atPoint((touch.location(in: self))).name == smallShipWindowPuzzle.name {
        if smallShipWindowPuzzle.position != bigShipWindowPuzzle.position{
          smallShipWindowPuzzle.position = location
          smallShipWindowPuzzle.inputView?.isMultipleTouchEnabled = false
          smallShipWindowPuzzle.zPosition = 3
          smallShipWindowPuzzle.scale(to: CGSize(width: 246, height: 135))
        }
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if atPoint(touch.location(in: self)).name == smallHullPuzzle.name {
        if smallHullPuzzle.frame.intersects(bigHullPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallHullPuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
          smallHullPuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallHullPuzzle.scale(to: CGSize(width: 320, height: 100))
          smallHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallLifebuoyPuzzle.name {
        if smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
          smallLifebuoyPuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
          smallLifebuoyPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallRearHullPuzzle.name {
        if smallRearHullPuzzle.frame.intersects(bigRearHullPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallRearHullPuzzle.position = CGPoint(x: size.width/1.66, y: size.height/1.98)
          smallRearHullPuzzle.isUserInteractionEnabled = false
        }else{
          smallRearHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
          smallRearHullPuzzle.scale(to: CGSize(width: 230, height: 90))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallFrontHullPuzzle.name {
        if smallFrontHullPuzzle.frame.intersects(bigFrontHullPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallFrontHullPuzzle.position = CGPoint(x: size.width/2.85, y: size.height/1.8)
          smallFrontHullPuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallFrontHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
          smallFrontHullPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipRoofPuzzle.name {
        if smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallShipRoofPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
          smallShipRoofPuzzle.inputView?.isMultipleTouchEnabled = false
        }else{
          smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
          smallShipRoofPuzzle.scale(to: CGSize(width: 230, height: 60))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipWindowPuzzle.name {
        if smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallShipWindowPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
          smallShipWindowPuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
          smallShipWindowPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipYellowLinePuzzle.name {
        if smallShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame){
          Sound.sharedInstance.playButton(file: "soundSucces", fileExtension: "wav")
          smallShipYellowLinePuzzle.position = CGPoint(x: size.width/2.32, y: size.height/2.05)
          smallShipYellowLinePuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
          smallShipYellowLinePuzzle.scale(to: CGSize(width: 350, height: 70))
        }
      }
      
      if smallHullPuzzle.frame.intersects(bigHullPuzzle.frame) && smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame) && smallRearHullPuzzle.frame.intersects(bigRearHullPuzzle.frame) && smallFrontHullPuzzle.frame.intersects(bigFrontHullPuzzle.frame) && smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame) && smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame) && smallShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame) {
        gameFinish()
      } else{
        print("belum lengkap")
      }
    }
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    print(atPoint((touch?.location(in: self))!))
    if atPoint((touch?.location(in: self))!).name == buttonClose.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonTutup" {
          run(clickButton)
          buttonTutupSceneAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonQuestion.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonTanya" {
          run(clickButton)
          buttonTanyaAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonHome.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonHome" {
          run(clickButton)
          Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
          buttonHomeAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonReplayGame.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "replayGame" {
          run(clickButton)
          buttonBackToGame()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonNextStory.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "nextStory" {
          run(clickButton)
          buttonNextStoryScene()
        }
      }
    }
  }
  
  func buttonTutupSceneAksi() {
    popUpStart.isHidden = true
    buttonClose.isHidden = true
    backgroundOpacity.isHidden = true
  }
  
  func buttonBackToGame() {
    Sound.sharedInstance.stopBacksound()
    let reveal = SKTransition.reveal(with: .right, duration: 1)
    let prevScene = MalinKundang_ChooseShip(size: CGSize(width: 2048, height: 1536))
    prevScene.scaleMode = .aspectFill
    scene?.view!.presentScene(prevScene, transition: reveal)
  }
  
  func gameFinish(){
    backgroundOpacity.isHidden = false
    popUpFinish.isHidden = false
    buttonNextStory.isHidden = false
    buttonReplayGame.isHidden = false
  }
  
  func buttonTanyaAksi(){
    popUpStart.isHidden = false
    buttonClose.isHidden = false
    backgroundOpacity.isHidden = false
  }
  
  func buttonHomeAksi(){
    Sound.sharedInstance.stopBacksound()
    self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
  }
  
  func buttonNextStoryScene() {
    if buttonNextStory.action(forKey: "Button Next") == nil {
      Sound.sharedInstance.stopBacksound()
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

