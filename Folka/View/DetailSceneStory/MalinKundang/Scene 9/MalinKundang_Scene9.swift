//
//  MalinKundang_Scene9.swift
//  Folka
//
//  Created by Ferry Julian on 24/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene9: SKScene {
  
  let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
  let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
  let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
  
  let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
  
  let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
  var animationTree: SKAction?
  
  
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  var buttonHomeAction: SKAction?
  
  let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
  var buttonNextAction: SKAction?
  
  let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
  var buttonPreviousAction: SKAction?
  
  
  var labelTextStory = SKLabelNode(fontNamed: "Nunito")
  
  var dubbingMalin: SKAction = SKAction.playSoundFileNamed("09.m4a", waitForCompletion: false)
  var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
  var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  
  override func didMove(to view: SKView) {
    let rect = CGRect(x: 0, y: 0, width: 200, height: 0)
    let path = CGPath(rect: rect, transform: nil)
    
    self.backgroundColor = SKColor.white
    
    backgroundSky.size = CGSize(width: 2050, height: 1120)
    backgroundSky.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundSky.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundSky.zPosition = 1
    addChild(backgroundSky)
    
    backgroundGround.size = CGSize(width: 2050, height: 1120)
    backgroundGround.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundGround.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundGround.zPosition = -1
    addChild(backgroundGround)
    
    buttonHome.name = "buttonHome"
    buttonHome.size = CGSize(width: 150, height: 150)
    buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = +4
    addChild(buttonHome)
    
    buttonNext.name = "buttonNext"
    buttonNext.size = CGSize(width: 150, height: 150)
    buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
    buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonNext.zPosition = 4
    addChild(buttonNext)
    
    buttonPrevious.name = "buttonPrevious"
    buttonPrevious.size = CGSize(width: 150, height: 150)
    buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
    buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonPrevious.zPosition = 4
    addChild(buttonPrevious)

    
    nonCharacterSea.size = CGSize(width: 2050, height: 1120)
    nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
    nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterSea.zPosition = 0
    nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
    addChild(nonCharacterSea)
    
    backgroundOpacity.size = CGSize(width: 2050, height: 1120)
    backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundOpacity.zPosition = 1.75
    addChild(backgroundOpacity)
    
    labelTextStory.text = "2 TAHUN KEMUDIAN.."
    labelTextStory.fontColor = SKColor.white
    labelTextStory.fontSize = 100
    labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
    labelTextStory.numberOfLines = 0
    labelTextStory.preferredMaxLayoutWidth = 1400
    labelTextStory.position = CGPoint(x: size.width/2, y: size.height/2.4)
    labelTextStory.zPosition = 2
    addChild(labelTextStory)
    
    nonCharacterTree.name = "tree"
    nonCharacterTree.size = CGSize(width: 450, height: 700)
    nonCharacterTree.position = CGPoint(x: size.width/13.0, y: size.height/2.6)
    nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterTree.zPosition = 1.5
    nonCharacterTree.zRotation = CGFloat.pi / -23
    addChild(nonCharacterTree)
    
    run(dubbingMalin)
    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
//      let reveal = SKTransition.reveal(with: .left, duration: 1)
//      let newScene = MalinKundang_Scene10(size: CGSize(width: 2048, height: 1536))
//      newScene.scaleMode = .aspectFill
//      self.scene?.view!.presentScene(newScene, transition: reveal)
//    }
  }
  
  override init(size: CGSize){
    var texturesTree: [SKTexture] = []
    for index in 1...2 {
      texturesTree.append(SKTexture(imageNamed: "tree\(index)"))
    }
    
    animationTree = SKAction.animate(with: texturesTree, timePerFrame: 0.5)
    
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    
    buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    

    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startTreeAnimation() {
    if nonCharacterTree.action(forKey: "Tree Animation") == nil {
      nonCharacterTree.run(SKAction.repeatForever(animationTree!), withKey: "Tree Animation")
    }
  }
  
  override func update(_ currentTime: TimeInterval) {
    startTreeAnimation()
  }
  
  func buttonNextScene() {
      if stateMusic {
          run(clickButton)
      }
      
      if buttonNext.action(forKey: "Button Next") == nil {
          Sound.sharedInstance.stop()
          buttonNext.run((buttonNextAction!), withKey: "Button Next")
          let reveal = SKTransition.reveal(with: .left, duration: 1)
          let newScene = MalinKundang_Scene11(size: CGSize(width: 2048, height: 1536))
          newScene.scaleMode = .aspectFill
          scene?.view!.presentScene(newScene, transition: reveal)
      }
  }
  
  func buttonPreviousScene() {
      if stateMusic {
          run(clickButton)
      }
      if buttonPrevious.action(forKey: "Button Previous") == nil {
          Sound.sharedInstance.stop()
          buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
          let reveal = SKTransition.reveal(with: .right, duration: 1)
          let prevScene = MalinKundang_Scene8(size: CGSize(width: 2048, height: 1536))
          prevScene.scaleMode = .aspectFill
          scene?.view!.presentScene(prevScene, transition: reveal)
      }
  }
  
  func buttonHomeScene() {
      if stateMusic {
          run(clickButton)
      }
      if buttonHome.action(forKey: "Button Home") == nil {
          Sound.sharedInstance.stop()
          Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
          buttonHome.run((buttonHomeAction!), withKey: "Button Home")
          self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
      }
  }

  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
           print(atPoint((touch?.location(in: self))!))
  if atPoint((touch?.location(in: self))!).name == buttonNext.name {
        enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if node.name == "buttonNext" {
                buttonNextScene()
            }
        }
    } else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
        enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if !self.buttonPrevious.hasActions(){
                if node.name == "buttonPrevious" {
                    buttonPreviousScene()
                }
            }
        }
    } else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
        enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if !self.buttonHome.hasActions(){
                if node.name == "buttonHome" {
                    buttonHomeScene()
                }
            }
        }
    }

  }
}
