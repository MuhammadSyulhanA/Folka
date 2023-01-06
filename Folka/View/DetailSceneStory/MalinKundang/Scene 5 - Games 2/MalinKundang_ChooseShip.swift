//
//  MalinKundang_ScenePilihKapal.swift
//  Folka
//
//  Created by Ferry Julian on 05/12/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_ChooseShip: SKScene {
  //MARK: Background
  let backgroundPuzzle = SKSpriteNode(imageNamed: "backgroundPuzzle")
  
  //MARK: Non Character
  let nonCharacterTitle = SKSpriteNode(imageNamed: "judulPilihPuzzle")
  let nonCharacterWoodChoose1 = SKSpriteNode(imageNamed: "backgroundKayuMilih")
  var animateWoodChoose1: SKAction?
  let nonCharacterWoodChoose2 = SKSpriteNode(imageNamed: "backgroundKayuMilih")
  var animateWoodChoose2: SKAction?
  let nonCharacterWood1 = SKSpriteNode(imageNamed: "backgroundKayu")
  var animateWood1: SKAction?
  let nonCharacterWood2 = SKSpriteNode(imageNamed: "backgroundKayu")
  var animateWood2: SKAction?
  let nonCharacterOneShip = SKSpriteNode(imageNamed: "objectKapalSatu")
  var animationOneShip: SKAction?
  let nonCharacterTwoShip = SKSpriteNode(imageNamed: "objectKapalDua")
  var animationTwoShip: SKAction?
  
  //MARK: Button
  let buttonStart = SKSpriteNode(imageNamed: "buttonMulai")
  var buttonStartAction: SKAction?
  var state = 0
  
  override func didMove(to view: SKView) {
    //MARK: Background
    self.backgroundColor = SKColor.white
    
    backgroundPuzzle.size = CGSize(width: 2050, height: 1120)
    backgroundPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundPuzzle.zPosition = 0
    addChild(backgroundPuzzle)
    
    //MARK: Non Character
    nonCharacterTitle.size = CGSize(width: 800, height: 100)
    nonCharacterTitle.position = CGPoint(x: size.width/2.0, y: size.height/1.35)
    nonCharacterTitle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterTitle.zPosition = 1
    addChild(nonCharacterTitle)
    
    nonCharacterWood1.size = CGSize(width: 700, height: 450)
    nonCharacterWood1.name = "WoodChoose1"
    nonCharacterWood1.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
    nonCharacterWood1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterWood1.zPosition = 1
    addChild(nonCharacterWood1)
    
    nonCharacterWood2.size = CGSize(width: 700, height: 450)
    nonCharacterWood2.name = "WoodChoose2"
    nonCharacterWood2.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
    nonCharacterWood2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterWood2.zPosition = 1
    addChild(nonCharacterWood2)
    
    nonCharacterWoodChoose1.size = CGSize(width: 710, height: 460)
    nonCharacterWoodChoose1.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
    nonCharacterWoodChoose1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterWoodChoose1.zPosition = 1.5
    nonCharacterWoodChoose1.isHidden = true
    addChild(nonCharacterWoodChoose1)
    
    nonCharacterWoodChoose2.size = CGSize(width: 710, height: 460)
    nonCharacterWoodChoose2.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
    nonCharacterWoodChoose2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterWoodChoose2.zPosition = 1.5
    nonCharacterWoodChoose2.isHidden = true
    addChild(nonCharacterWoodChoose2)
    
    nonCharacterOneShip.size = CGSize(width: 450, height: 300)
    nonCharacterOneShip.name = "OneShip"
    nonCharacterOneShip.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
    nonCharacterOneShip.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterOneShip.zPosition = 2
    addChild(nonCharacterOneShip)
    
    nonCharacterTwoShip.size = CGSize(width: 450, height: 300)
    nonCharacterTwoShip.name = "TwoShip"
    nonCharacterTwoShip.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
    nonCharacterTwoShip.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterTwoShip.zPosition = 2
    addChild(nonCharacterTwoShip)
    
    //MARK: Button
    buttonStart.name = "buttonStart"
    buttonStart.size = CGSize(width: 450, height: 120)
    buttonStart.position = CGPoint(x: size.width/2.0, y: size.height/3.63)
    buttonStart.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonStart.zPosition = 2
    addChild(buttonStart)
  }
  
  //MARK: Animation
  
  override init(size: CGSize){
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    
    buttonStartAction = SKAction.sequence([buttonToSmall, buttonToBig])
    animateWood1 = SKAction.sequence([buttonToSmall, buttonToBig])
    animateWood2 = SKAction.sequence([buttonToSmall, buttonToBig])
    animateWoodChoose1 = SKAction.sequence([buttonToSmall, buttonToBig])
    animateWoodChoose2 = SKAction.sequence([buttonToSmall, buttonToBig])
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func chooseOneShip() {
    state = 1
    nonCharacterWoodChoose2.isHidden = true
    nonCharacterWoodChoose1.isHidden = false
    UserDefaults.standard.set("objectOneShip", forKey: "pickShip")
    print(state)
  }
  
  func chooseTwoShip() {
    state = 2
    nonCharacterWoodChoose1.isHidden = true
    nonCharacterWoodChoose2.isHidden = false
    UserDefaults.standard.set("objecTwoShip", forKey: "pickTwo")
    print(state)
  }
  
  func startAction(){
    if state == 1 {
      let reveal = SKTransition.reveal(with: .left, duration: 1)
      let newScene = MalinKundang_Puzzle1(size: CGSize(width: 2050, height: 1536))
      newScene.scaleMode = .aspectFill
      scene?.view!.presentScene(newScene, transition: reveal)
    }  else if state == 2 {
      let reveal = SKTransition.reveal(with: .left, duration: 1)
      let newScene = MalinKundang_Puzzle2(size: CGSize(width: 2050, height: 1536))
      newScene.scaleMode = .aspectFill
      scene?.view!.presentScene(newScene, transition: reveal)
    }
  }
  
  //MARK: Touches
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    if atPoint((touch?.location(in: self))!).name == nonCharacterOneShip.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "OneShip" {
          chooseOneShip()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == nonCharacterTwoShip.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "TwoShip" {
          chooseTwoShip()
        }
      }
    }
    
    if atPoint((touch?.location(in: self))!).name == buttonStart.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonStart" {
          startAction()
        }
      }
    }
  }
}
