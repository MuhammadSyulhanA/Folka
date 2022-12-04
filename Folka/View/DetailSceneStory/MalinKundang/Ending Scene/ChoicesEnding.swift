//
//  ChoicesEnding.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 05/12/22.
//
import SpriteKit
import GameplayKit

class ChoicesEnding: SKScene {
  let background = SKSpriteNode(imageNamed: "backgroudBookDetail")
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  var buttonHomeAction: SKAction?
  let buttonMintaMaaf = SKSpriteNode(imageNamed: "buttonMintaMaaf")
  var buttonMintaMaafAction: SKAction?
  let buttonMenyambut = SKSpriteNode(imageNamed: "buttonMenyambut")
  var buttonMenyambutAction: SKAction?
  
  // sound
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  
  override init(size: CGSize) {
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonMintaMaafAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func didMove(to view: SKView) {
    // MARK: Default background white
    self.backgroundColor = SKColor.white
    
    background.size = CGSize(width: 2050, height: 1120)
    background.position = CGPoint(x: size.width/2, y: size.height/2)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.zPosition = -1
    addChild(background)
    
    buttonHome.size = CGSize(width: 150, height: 150)
    buttonHome.name = "buttonHome"
    buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 1.5
    addChild(buttonHome)
    
    buttonMintaMaaf.name = "buttonMintaMaaf"
    buttonMintaMaaf.size = CGSize(width: 850, height: 150)
    buttonMintaMaaf.position = CGPoint(x: size.width/2.7, y: size.height/3.5)
    buttonMintaMaaf.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonMintaMaaf.zPosition = 1
    addChild(buttonMintaMaaf)
    
    buttonMenyambut.name = "buttonMenyambut"
    buttonMenyambut.size = CGSize(width: 850, height: 150)
    buttonMenyambut.position = CGPoint(x: size.width/1.5, y: size.height/3.5)
    buttonMenyambut.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonMenyambut.zPosition = 1
    addChild(buttonMenyambut)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  
  override func update(_ currentTime: TimeInterval) {
  }
}


