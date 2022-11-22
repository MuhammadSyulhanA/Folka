//
//  MalinKundang_Scene6.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 21/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene6: SKScene {
  
  //MARK: Library sesuaikan dengan framework
  let backgroundScene6 = SKSpriteNode(imageNamed: "backgroundScene6")
  let kayuScene6 = SKSpriteNode(imageNamed: "kayuscene6")
  let characterMalin = SKSpriteNode(imageNamed: "malinScene1_1")
  var animationMalin: SKAction?
  
  let kapalScene6 = SKSpriteNode(imageNamed: "kapalscene6")
  
  let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene6_1")
  var animationIbuMalin: SKAction?
  
  let buttonHome = SKSpriteNode(imageNamed: "ButtonHome")
  let buttonSound = SKSpriteNode(imageNamed: "ButtonSound")
  let buttonNext = SKSpriteNode(imageNamed: "ButtonNext")
  var buttonNextAction: SKAction?
  
  //  let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
  var labelTextStory = SKLabelNode(fontNamed: "McLaren")
  
  override func didMove(to view: SKView) {
    
    // MARK: Default background white
    self.backgroundColor = SKColor.white
    
    backgroundScene6.size = CGSize(width: 2040, height: 1120)
    backgroundScene6.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundScene6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundScene6.zPosition = -1
    addChild(backgroundScene6)
    
    kapalScene6.name = "kapalScene6"
    kapalScene6.size = CGSize(width: 1200, height: 650)
    kapalScene6.position = CGPoint(x: size.width/1.7, y: size.height/1.9)
    kapalScene6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kapalScene6.zPosition = 2
    addChild(kapalScene6)
    
    characterIbuMalin.name = "ibuMalin"
    characterIbuMalin.size = CGSize(width: 450, height: 600)
    characterIbuMalin.position = CGPoint(x: size.width/7, y: size.height/2.5)
    characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    characterIbuMalin.zPosition = 2
    addChild(characterIbuMalin)
    
    buttonHome.name = "buttonHome"
    buttonHome.size = CGSize(width: 130, height: 130)
    buttonHome.position = CGPoint(x: size.width/10.5, y: size.height/1.35)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = +4
    addChild(buttonHome)
    
    buttonSound.name = "buttonSound"
    buttonSound.size = CGSize(width: 130, height: 130)
    buttonSound.position = CGPoint(x: size.width/1.1, y: size.height/1.35)
    buttonSound.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonSound.zPosition = +4
    addChild(buttonSound)
    
    kayuScene6.size = CGSize(width: 1100, height: 270)
    kayuScene6.position = CGPoint(x: size.width/2.2, y: size.height/3.6)
    kayuScene6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kayuScene6.zPosition = +4
    addChild(kayuScene6)
    
    buttonNext.name = "buttonNext"
    buttonNext.size = CGSize(width: 150, height: 150)
    buttonNext.position = CGPoint(x: size.width/1.1, y: size.height/3.2)
    buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonNext.zPosition = +4
    addChild(buttonNext)
    //
    //    nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
    //    nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
    //    nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //    nonCharacterTextLayout.zPosition = +4
    //    addChild(nonCharacterTextLayout)
    //
    //    labelTextStory.text = "Dahulu kala hiduplah seorang ibu bernama Mande Rubayah dan anak laki-lakinya, Malin Kundang. Mande Rubayah menghidupi Malin seorang diri hingga menjadi anak yang gagah dan tampan."
    //    labelTextStory.fontColor = SKColor.white
    //    labelTextStory.fontSize = 32
    //    labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
    //    labelTextStory.numberOfLines = 0
    //    labelTextStory.preferredMaxLayoutWidth = 1300
    //    labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
    //    labelTextStory.zPosition = +4.5
    //    addChild(labelTextStory)
  }
  
  //MARK: SOURCE CODE ASSET GERAK
  override init(size: CGSize){
    
    var textures1: [SKTexture] = []
    for index in 1...2 {
      textures1.append(SKTexture(imageNamed: "ibuMalinScene6_\(index)"))
    }
    
    animationIbuMalin = SKAction.animate(with: textures1, timePerFrame: 0.3)
    buttonNextAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
    
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func buttonNextScene() {
    if buttonNext.action(forKey: "Button Next") == nil {
      buttonNext.run(SKAction.repeatForever(buttonNextAction!), withKey: "Button Next")
      let reveal = SKTransition.reveal(with: .left, duration: 1)
      let newScene = MalinKundang_Scene2(size: CGSize(width: 2048, height: 1536))
      newScene.scaleMode = .aspectFill
      scene?.view!.presentScene(newScene, transition: reveal)
    }
  }
  
  func startMalinAnimation() {
    if characterMalin.action(forKey: "Malin Scene1") == nil {
      characterMalin.run(SKAction.repeatForever(animationMalin!), withKey: "Malin Scene1")
    }
  }
  
  func stopMalinAnimation() {
    characterMalin.removeAction(forKey: "Malin Scene1")
  }
  
  func startIbuMalinAnimation() {
    if characterIbuMalin.action(forKey: "Ibu Malin Scene1") == nil {
      characterIbuMalin.run(SKAction.repeatForever(animationIbuMalin!), withKey: "Ibu Malin Scene1")
    }
  }
  
  func stopIbuMalinAnimation() {
    characterIbuMalin.removeAction(forKey: "Ibu Malin Scene1")
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    kapalScene6.run(SKAction.moveTo(x: 2800, duration: 5.0))
  }
  
  override func update(_ currentTime: TimeInterval) {
    startIbuMalinAnimation()
  }
}
