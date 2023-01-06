//
//  MalinKundang_Tutorial_Games1.swift
//  Folka
//
//  Created by Ferry Julian on 19/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Tutorial_Games1: SKScene {
  //MARK: Background
  let backgroundTutorial = SKSpriteNode(imageNamed: "backgroundTutorialGames1")
  
  //MARK: Non Character
  let nonCharacterPopUp = SKSpriteNode(imageNamed: "tutorialPopUp")
  
  //MARK: Button
  let buttonFishing = SKSpriteNode(imageNamed: "buttonStartFishing")
  let buttonFishingAction: SKAction?
  
  //MARK: Sound and Music
  var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
  var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
  var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
  
  override func didMove(to view: SKView) {
    //MARK: Background
    self.backgroundColor = SKColor.white
    backgroundTutorial.size = CGSize(width: 2050, height: 1050)
    backgroundTutorial.position = CGPoint(x: size.width/2, y: size.height/2)
    backgroundTutorial.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    backgroundTutorial.zPosition = -1
    addChild(backgroundTutorial)
    
    //MARK: Non Character
    nonCharacterPopUp.size = CGSize(width: 1250, height: 850)
    nonCharacterPopUp.position = CGPoint(x: size.width/2, y: size.height/2)
    nonCharacterPopUp.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    nonCharacterPopUp.zPosition = 0
    addChild(nonCharacterPopUp)
    
    //MARK: Button
    buttonFishing.name = "buttonNext"
    buttonFishing.size = CGSize(width: 580, height: 130)
    buttonFishing.position = CGPoint(x: size.width/2, y: size.height/3.4)
    buttonFishing.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonFishing.zPosition = 1
    addChild(buttonFishing)
  }
  
  //MARK: Animation
  override init(size: CGSize){
    let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
    let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
    buttonFishingAction = SKAction.sequence([buttonToSmall, buttonToBig])
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func buttonNextScene() {
    if stateMusic {
      run(clickButton)
    }
    
    if buttonFishing.action(forKey: "Button Fishing") == nil {
      buttonFishing.run((buttonFishingAction!), withKey: "Button Next")
      let reveal = SKTransition.reveal(with: .up, duration: 1)
      let newScene = MalinKundang_Games1(size: CGSize(width: 2048, height: 1536))
      newScene.scaleMode = .aspectFill
      scene?.view!.presentScene(newScene, transition: reveal)
    }
  }
  
  //MARK: Touches
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first as UITouch?
    print(atPoint((touch?.location(in: self))!))
    if atPoint((touch?.location(in: self))!).name == buttonFishing.name {
      enumerateChildNodes(withName: "//*") { [self] (node, stop) in
        if !self.buttonFishing.hasActions(){
          if node.name == "buttonNext" {
            run(clickButton)
            buttonNextScene()
          }
        }
      }
    }
  }
}
