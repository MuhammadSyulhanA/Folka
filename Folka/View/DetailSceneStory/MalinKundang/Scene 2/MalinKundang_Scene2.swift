//
//  MalinKundang_Scene2.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene2: SKScene {
  
  //MARK: Background
  let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
  let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
  
  //MARK: Non Character
  let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
  let nonCharacterHouse = SKSpriteNode(imageNamed: "house1")
  var animationHouse: SKAction?
  let nonCharacterHouse1 = SKSpriteNode(imageNamed: "house1")
  var animationHouse1: SKAction?
  let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
  var animationTree: SKAction?
  let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
  
  //MARK: Character
  let characterMalin = SKSpriteNode(imageNamed: "malinScene2_1")
  var animationMalin: SKAction?
  
  //MARK: Button
  let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
  var buttonNextAction: SKAction?
  let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
  var buttonPreviousAction: SKAction?
  let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
  var buttonHomeAction: SKAction?
  
  //MARK: Text Label
  var labelTextStory = SKLabelNode(fontNamed: "Nunito")
  
  //MARK: Sound and Music
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
  var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
  
  override func didMove(to view: SKView) {
    //MARK: Background
    let rect = CGRect(x: 0, y: 0, width: 100, height: 0)
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
    
    //MARK: Non Character
    nonCharacterSea.size = CGSize(width: 2050, height: 1120)
    nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
    nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterSea.zPosition = 0
    nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
    addChild(nonCharacterSea)
    
    nonCharacterHouse.name = "house"
    nonCharacterHouse.size = CGSize(width: 300, height: 250)
    nonCharacterHouse.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
    nonCharacterHouse.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterHouse.zPosition = 3
    addChild(nonCharacterHouse)
    
    nonCharacterTree.name = "tree"
    nonCharacterTree.size = CGSize(width: 450, height: 700)
    nonCharacterTree.position = CGPoint(x: size.width/13.0, y: size.height/2.6)
    nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterTree.zPosition = 3.5
    nonCharacterTree.zRotation = CGFloat.pi / -23
    addChild(nonCharacterTree)
    
    nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
    nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
    nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterTextLayout.zPosition = +4
    addChild(nonCharacterTextLayout)
    
    //MARK: Character
    characterMalin.name = "malin"
    characterMalin.size = CGSize(width: 500, height: 600)
    characterMalin.position = CGPoint(x: size.width/1.3, y: size.height/2.1)
    characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    characterMalin.zPosition = 2
    addChild(characterMalin)
    
    //MARK: Button
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
    
    buttonHome.name = "buttonHome"
    buttonHome.size = CGSize(width: 150, height: 150)
    buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = +4
    addChild(buttonHome)
    
    //MARK: Text Label
    labelTextStory.text = "Malin pun menjadi anak yang berbakti, ia juga sangat suka memancing ditepi laut untuk dimakan bersama ibunya."
    labelTextStory.fontColor = SKColor.white
    labelTextStory.fontSize = 42
    labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
    labelTextStory.numberOfLines = 0
    labelTextStory.preferredMaxLayoutWidth = 1300
    labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
    labelTextStory.zPosition = +4.5
    addChild(labelTextStory)
    
    //MARK: Sound
    Sound.sharedInstance.playDubbing(file: "02 1", fileExtension: "m4a")
    
  }
  
  //MARK: Button
  
  func buttonNextScene() {
    if stateMusic {
      run(clickButton)
    }
    
    if buttonNext.action(forKey: "Button Next") == nil {
      Sound.sharedInstance.stop()
      Sound.sharedInstance.stopBacksound()
      buttonNext.run((buttonNextAction!), withKey: "Button Next")
      let reveal = SKTransition.reveal(with: .left, duration: 1)
      let newScene = MalinKundang_Tutorial_Games1(size: CGSize(width: 2048, height: 1536))
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
      let prevScene = MalinKundang_Scene1(size: CGSize(width: 2048, height: 1536))
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
      Sound.sharedInstance.stopBacksound()
      buttonHome.run((buttonHomeAction!), withKey: "Button Home")
      //            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
      self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
      Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
    }
  }
  
  //MARK: Animation
  
  override init(size: CGSize){
    var textures: [SKTexture] = []
    for index in 1...3 {
      textures.append(SKTexture(imageNamed: "malinScene2_\(index)"))
    }
    
    var textures2: [SKTexture] = []
    for index in 1...2 {
      textures2.append(SKTexture(imageNamed: "tree\(index)"))
    }
    
    var textures3: [SKTexture] = []
    for index in 1...2 {
      textures3.append(SKTexture(imageNamed: "house\(index)"))
    }
    
    var textures4: [SKTexture] = []
    for index in 1...2 {
      textures4.append(SKTexture(imageNamed: "house\(index)"))
    }
    
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
    buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
    animationMalin = SKAction.animate(with: textures, timePerFrame: 0.3)
    animationTree = SKAction.animate(with: textures2, timePerFrame: 0.5)
    animationHouse = SKAction.animate(with: textures3, timePerFrame: 0.5)
    animationHouse1 = SKAction.animate(with: textures4, timePerFrame: 0.5)
    
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startMalinAnimation() {
    if characterMalin.action(forKey: "Malin Scene1") == nil {
      characterMalin.run(SKAction.repeatForever(animationMalin!), withKey: "Malin Scene1")
    }
  }
  
  func stopMalinAnimation() {
    characterMalin.removeAction(forKey: "Malin Scene1")
  }
  
  func startTreeAnimation() {
    if nonCharacterTree.action(forKey: "Tree") == nil {
      nonCharacterTree.run(SKAction.repeatForever(animationTree!), withKey: "Tree")
    }
  }
  
  func stopTreeAnimation() {
    nonCharacterTree.removeAction(forKey: "Tree")
  }
  
  func startHouseAnimation() {
    if nonCharacterHouse.action(forKey: "House") == nil {
      nonCharacterHouse.run(SKAction.repeatForever(animationHouse!), withKey: "House")
    }
  }
  
  func stopHouseAnimation() {
    nonCharacterHouse.removeAction(forKey: "House")
  }
  
  func startHouse1Animation() {
    if nonCharacterHouse1.action(forKey: "House1") == nil {
      nonCharacterHouse1.run(SKAction.repeatForever(animationHouse1!), withKey: "House1")
    }
  }
  
  func stopHouse1Animation() {
    nonCharacterHouse1.removeAction(forKey: "House1")
  }
  
  //MARK: Touches
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    print(atPoint((touch?.location(in: self))!))
    if atPoint((touch?.location(in: self))!).name == characterMalin.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.characterMalin.hasActions(){
          if node.name == "malin" {
            startMalinAnimation()
          }
          
        } else{
          if node.name == "malin" {
            stopMalinAnimation()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == nonCharacterTree.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.nonCharacterTree.hasActions(){
          if node.name == "tree" {
            startTreeAnimation()
          }
        }else{
          if node.name == "tree" {
            stopTreeAnimation()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == nonCharacterHouse.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.nonCharacterHouse.hasActions(){
          if node.name == "house" {
            startHouseAnimation()
          }
        }else{
          if node.name == "house" {
            stopHouseAnimation()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == nonCharacterHouse1.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.nonCharacterHouse1.hasActions(){
          if node.name == "house1" {
            startHouse1Animation()
          }
        }else{
          if node.name == "house1" {
            stopHouse1Animation()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == buttonNext.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.buttonNext.hasActions(){
          if node.name == "buttonNext" {
            buttonNextScene()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.buttonPrevious.hasActions(){
          if node.name == "buttonPrevious" {
            buttonPreviousScene()
          }
        }
      }
    }else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if node.name == "buttonHome" {
          buttonHomeScene()
        }
      }
    }
  }
}
