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
  let popUpStart = SKSpriteNode(imageNamed: "popUpPuzzleSecond")
  let popUpFinish = SKSpriteNode(imageNamed: "popUpSuccesShipSecond")
  
  //MARK: Background
  let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
  let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
  
  //MARK: Button
  let buttonClose = SKSpriteNode(imageNamed: "buttonClose")
  let buttonCloseAction: SKAction?
  let buttonNextStory = SKSpriteNode(imageNamed: "buttonNextStoryPuzzle")
  var buttonNextStoryAction: SKAction?
  let buttonReplayGame = SKSpriteNode(imageNamed: "buttonPlayAgainPuzzle")
  var buttonReplayAction: SKAction?
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  let buttonHomeAction: SKAction?
  let buttonQuestion = SKSpriteNode(imageNamed: "buttonAsk")
  let buttonQuestionAction: SKAction?
  
  //MARK: Non Character
  let nonCharacterWoodPuzzle = SKSpriteNode(imageNamed: "woodPuzzle")
  let nonCharacterOutlineShip = SKSpriteNode(imageNamed: "outlineShipSecond")
  
  //MARK: Small Puzzles
  let smallHullPuzzle = SKSpriteNode(imageNamed: "hullShipSecond")
  let smallShipRoofPuzzle = SKSpriteNode(imageNamed: "roofShipSecond")
  let smallFrontHullPuzzle = SKSpriteNode(imageNamed: "frontHullSecond")
  let smallRearHullPuzzle = SKSpriteNode(imageNamed: "rearHullSecond")
  let smallShipYellowLinePuzzle = SKSpriteNode(imageNamed: "yellowLineShipSecond")
  let smallShipWindowPuzzle = SKSpriteNode(imageNamed: "windowShipSecond")
  let smallLifebuoyPuzzle = SKSpriteNode(imageNamed: "lifebouyShipSecond")
  
  //MARK: Big Puzzles
  let bigHullPuzzle = SKSpriteNode(imageNamed: "hullShipSecond")
  let bigShipRoofPuzzle = SKSpriteNode(imageNamed: "roofShipSecond")
  let bigFrontHullPuzzle = SKSpriteNode(imageNamed: "frontHullSecond")
  let bigRearHullPuzzle = SKSpriteNode(imageNamed: "rearHullSecond")
  let bigShipYellowLinePuzzle = SKSpriteNode(imageNamed: "yellowLineShipSecond")
  let bigShipWindowPuzzle = SKSpriteNode(imageNamed: "windowShipSecond")
  let bigLifebuoyPuzzle = SKSpriteNode(imageNamed: "lifebouyShipSecond")
  
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
    buttonClose.name = "buttonClose"
    buttonClose.position = CGPoint(x: size.width/2, y: size.height/3.4)
    buttonClose.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonClose.zPosition = 6
    buttonClose.isHidden = false
    addChild( buttonClose)
    
    buttonHome.size = CGSize(width: 150, height: 150)
    buttonHome.position = CGPoint(x: size.width/17, y: size.height/1.38)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    buttonHome.name = "buttonHome"
    addChild(buttonHome)
    
    buttonQuestion.size = CGSize(width: 150, height: 150)
    buttonQuestion.position = CGPoint(x: size.width/17, y: size.height/1.68)
    buttonQuestion.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonQuestion.zPosition = 2
    buttonQuestion.name = "buttonAsk"
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
    smallHullPuzzle.name = "smallHullPuzzle"
    smallHullPuzzle.scale(to: CGSize(width: 320, height: 100))
    smallHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
    smallHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallHullPuzzle.zPosition = 3
    addChild(smallHullPuzzle)
    
    smallLifebuoyPuzzle.name = "smallLifebuoyPuzzle"
    smallLifebuoyPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
    smallLifebuoyPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallLifebuoyPuzzle.zPosition = 3
    addChild(smallLifebuoyPuzzle)
    
    smallRearHullPuzzle.name = "smallRearHullPuzzle"
    smallRearHullPuzzle.scale(to: CGSize(width: 230, height: 90))
    smallRearHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
    smallRearHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallRearHullPuzzle.zPosition = 3
    addChild(smallRearHullPuzzle)
    
    smallFrontHullPuzzle.name = "smallFrontHullPuzzle"
    smallFrontHullPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallFrontHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
    smallFrontHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallFrontHullPuzzle.zPosition = 3
    addChild(smallFrontHullPuzzle)
    
    smallShipRoofPuzzle.name = "smallShipRoofPuzzle"
    smallShipRoofPuzzle.scale(to: CGSize(width: 230, height: 60))
    smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
    smallShipRoofPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipRoofPuzzle.zPosition = 3
    addChild(smallShipRoofPuzzle)
    
    smallShipWindowPuzzle.name = "smallShipWindowPuzzle"
    smallShipWindowPuzzle.scale(to: CGSize(width: 230, height: 100))
    smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
    smallShipWindowPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipWindowPuzzle.zPosition = 3
    addChild(smallShipWindowPuzzle)
    
    smallShipYellowLinePuzzle.name = "smallShipYellowLinePuzzle"
    smallShipYellowLinePuzzle.scale(to: CGSize(width: 350, height: 70))
    smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
    smallShipYellowLinePuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    smallShipYellowLinePuzzle.zPosition = 3
    addChild(smallShipYellowLinePuzzle)
    
    //MARK: Big Puzzles Position
    bigHullPuzzle.scale(to: CGSize(width: 1213, height: 391))
    bigHullPuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
    bigHullPuzzle.alpha = 0
    addChild(bigHullPuzzle)
    
    bigShipYellowLinePuzzle.scale(to: CGSize(width: 1354, height: 227))
    bigShipYellowLinePuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
    bigShipYellowLinePuzzle.alpha = 0
    addChild(bigShipYellowLinePuzzle)
    
    bigLifebuoyPuzzle.scale(to: CGSize(width: 248, height: 108))
    bigLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
    bigLifebuoyPuzzle.alpha = 0
    addChild(bigLifebuoyPuzzle)
    
    bigRearHullPuzzle.scale(to: CGSize(width: 362, height: 135))
    bigRearHullPuzzle.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
    bigRearHullPuzzle.alpha = 0
    addChild(bigRearHullPuzzle)
    
    bigFrontHullPuzzle.scale(to: CGSize(width: 446, height: 253))
    bigFrontHullPuzzle.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
    bigFrontHullPuzzle.alpha = 0
    addChild(bigFrontHullPuzzle)
    
    bigShipRoofPuzzle.scale(to: CGSize(width: 375, height: 94))
    bigShipRoofPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
    bigShipRoofPuzzle.alpha = 0
    addChild(bigShipRoofPuzzle)
    
    bigShipWindowPuzzle.scale(to: CGSize(width: 246, height: 135))
    bigShipWindowPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
    bigShipWindowPuzzle.alpha = 0
    addChild(bigShipWindowPuzzle)
    
    //MARK: Sound
    if UserDefaults.standard.bool(forKey: "fxMusic") {
      Sound.sharedInstance.playBacksound(file: "fishPuzzle", fileExtension: "wav")
    }
    
  }
  
  //MARK: Touches
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      if atPoint(touch.location(in: self)).name == smallHullPuzzle.name {
        if smallHullPuzzle.position != bigHullPuzzle.position{
          smallHullPuzzle.position = location
          smallHullPuzzle.zPosition = 2
          smallHullPuzzle.scale(to: CGSize(width: 1213, height: 391))
        }
      }else if atPoint(touch.location(in: self)).name == smallLifebuoyPuzzle.name {
        if smallLifebuoyPuzzle.position != bigLifebuoyPuzzle.position{
          smallLifebuoyPuzzle.position = location
          smallLifebuoyPuzzle.zPosition = 4
          smallLifebuoyPuzzle.scale(to: CGSize(width: 248, height: 108))
        }
      }else if atPoint(touch.location(in: self)).name == smallShipRoofPuzzle.name {
        if smallShipRoofPuzzle.position != bigShipRoofPuzzle.position{
          smallShipRoofPuzzle.position = location
          smallShipRoofPuzzle.zPosition = 4
          smallShipRoofPuzzle.scale(to: CGSize(width: 375, height: 94))
        }
      }else if atPoint(touch.location(in: self)).name == smallShipYellowLinePuzzle.name {
        if smallShipYellowLinePuzzle.position != bigShipYellowLinePuzzle.position{
          smallShipYellowLinePuzzle.position = location
          smallShipYellowLinePuzzle.zPosition = 3
          smallShipYellowLinePuzzle.scale(to: CGSize(width: 1354, height: 227))
        }
      }else if atPoint(touch.location(in: self)).name == smallFrontHullPuzzle.name {
        if smallFrontHullPuzzle.position != bigFrontHullPuzzle.position{
          smallFrontHullPuzzle.position = location
          smallFrontHullPuzzle.zPosition = 3
          smallFrontHullPuzzle.scale(to: CGSize(width: 446, height: 253))
        }
      }else if atPoint(touch.location(in: self)).name == smallRearHullPuzzle.name {
        if smallRearHullPuzzle.position != bigRearHullPuzzle.position{
          smallRearHullPuzzle.position = location
          smallRearHullPuzzle.zPosition = 3
          smallRearHullPuzzle.scale(to: CGSize(width: 362, height: 135))
        }
      }else if atPoint(touch.location(in: self)).name == smallShipWindowPuzzle.name {
        if smallShipWindowPuzzle.position != bigShipWindowPuzzle.position{
          smallShipWindowPuzzle.position = location
          smallShipWindowPuzzle.zPosition = 3
          smallShipWindowPuzzle.scale(to: CGSize(width: 246, height: 135))
        }
      } else{}
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if atPoint(touch.location(in: self)).name == smallHullPuzzle.name {
        if smallHullPuzzle.frame.intersects(bigHullPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallHullPuzzle.zPosition = 0
          smallHullPuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
          smallHullPuzzle.inputView?.isUserInteractionEnabled = true
        } else{
          smallHullPuzzle.scale(to: CGSize(width: 320, height: 100))
          smallHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.35)
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallLifebuoyPuzzle.name {
        if smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallLifebuoyPuzzle.zPosition = 2
          smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
          smallLifebuoyPuzzle.inputView?.isMultipleTouchEnabled = false
        } else{
          smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.55)
          smallLifebuoyPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallRearHullPuzzle.name {
        if smallRearHullPuzzle.frame.intersects(bigRearHullPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallRearHullPuzzle.zPosition = 0
          smallRearHullPuzzle.position = CGPoint(x: size.width/1.66, y: size.height/1.98)
        }else{
          smallRearHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.80)
          smallRearHullPuzzle.scale(to: CGSize(width: 230, height: 90))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallFrontHullPuzzle.name {
        if smallFrontHullPuzzle.frame.intersects(bigFrontHullPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallFrontHullPuzzle.zPosition = 0
          smallFrontHullPuzzle.inputView?.isUserInteractionEnabled = true
          smallFrontHullPuzzle.position = CGPoint(x: size.width/2.85, y: size.height/1.8)
        } else{
          smallFrontHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.10)
          smallFrontHullPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipRoofPuzzle.name {
        if smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallShipRoofPuzzle.zPosition = 1
          smallShipRoofPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
        }else{
          smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.50)
          smallShipRoofPuzzle.scale(to: CGSize(width: 230, height: 60))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipWindowPuzzle.name {
        if smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallShipWindowPuzzle.zPosition = 0
          smallShipWindowPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
        } else{
          smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.95)
          smallShipWindowPuzzle.scale(to: CGSize(width: 230, height: 100))
        }
      }
      
      if atPoint(touch.location(in: self)).name == smallShipYellowLinePuzzle.name {
        if smallShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame) == true{
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(soundSucces)
          }
          smallShipYellowLinePuzzle.zPosition = 1
          smallShipYellowLinePuzzle.position = CGPoint(x: size.width/2.32, y: size.height/2.05)
        } else{
          smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.65)
          smallShipYellowLinePuzzle.scale(to: CGSize(width: 350, height: 70))
        }
      }
      
      if smallHullPuzzle.frame.intersects(bigHullPuzzle.frame) && smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame) && smallRearHullPuzzle.frame.intersects(bigRearHullPuzzle.frame) && smallFrontHullPuzzle.frame.intersects(bigFrontHullPuzzle.frame) && smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame) && smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame) && smallShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame) {
        gameFinish()
      } else{
        print("not complete")
      }
    }
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    print(atPoint((touch?.location(in: self))!))
    if atPoint((touch?.location(in: self))!).name == buttonClose.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonClose" {
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
          }
          buttonTutupSceneAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonQuestion.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonAsk" {
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
          }
          buttonTanyaAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonHome.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonHome" {
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
          }
          Sound.sharedInstance.playBacksound(file: "startGame", fileExtension: "wav")
          buttonHomeAksi()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonReplayGame.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "replayGame" {
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
          }
          buttonBackToGame()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonNextStory.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "nextStory" {
          if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
          }
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

