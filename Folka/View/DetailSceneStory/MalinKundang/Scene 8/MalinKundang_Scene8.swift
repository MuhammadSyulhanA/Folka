//
//  MalinKundang_Scene8.swift
//  Folka
//
//  Created by Ferry Julian on 24/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene8: SKScene {
    let playableRect: CGRect

    let backgroundMarried = SKSpriteNode(imageNamed: "backgroundMarried")
    
    let characterMalin = SKSpriteNode(imageNamed: "malinScene8")
    
    let characterMalinWife = SKSpriteNode(imageNamed: "istriMalinScene8")
    
    let nonCharacterFlowers = SKSpriteNode(imageNamed: "marriedFlowers")
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?

    let buttonSound = SKSpriteNode(imageNamed: "buttonSound")
    
    let textLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "McLaren")
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 10.0/3.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        buttonNextAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
        buttonPreviousAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
        buttonHomeAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        backgroundMarried.size = CGSize(width: 2060, height: 1120)
        backgroundMarried.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundMarried.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundMarried.zPosition = 0
        addChild(backgroundMarried)
        
        nonCharacterFlowers.size = CGSize(width: 2060, height: 400)
        nonCharacterFlowers.position = CGPoint(x: size.width/2.0, y: size.height/1.5)
        nonCharacterFlowers.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterFlowers.zPosition = 1
        addChild(nonCharacterFlowers)
        
        characterMalinWife.name = "malinWife"
        characterMalinWife.size = CGSize(width: 700, height: 800)
        characterMalinWife.position = CGPoint(x: size.width/1.55, y: size.height/2.3)
        characterMalinWife.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinWife.zPosition = 2
        addChild(characterMalinWife)
        
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 800, height: 1300)
        characterMalin.position = CGPoint(x: size.width/3.0, y: size.height/2.95)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 170, height: 170)
        buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = 2.5
        addChild(buttonNext)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 170, height: 170)
        buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = 2.5
        addChild(buttonPrevious)
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 170, height: 170)
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 2.5
        addChild(buttonHome)
        
        buttonSound.name = "buttonSound"
        buttonSound.size = CGSize(width: 170, height: 170)
        buttonSound.position = CGPoint(x: size.width/1.07, y: size.height/1.38)
        buttonSound.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonSound.zPosition = 2.5
        addChild(buttonSound)
        
        textLayout.size = CGSize(width: 1300, height: 200)
        textLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        textLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        textLayout.zPosition = 2.5
        addChild(textLayout)
        
        labelTextStory.text = "Di sana ia menjadi pedagang kaya dan menikahi gadis cantik anak saudagar di desa itu."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1250
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
        labelTextStory.zPosition = 2.75
        addChild(labelTextStory)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(flowersPetalsRainy), SKAction.wait(forDuration: 1.0)])))

    }
    
    func flowersPetalsRainy() {
        let nonCharacterFlowersPetals = SKSpriteNode(imageNamed: "flowersPetals")
        nonCharacterFlowersPetals.name = "petals"
        nonCharacterFlowersPetals.position = CGPoint(x: CGFloat.random(min: playableRect.minX - nonCharacterFlowersPetals.size.height/2, max: playableRect.maxX + nonCharacterFlowersPetals.size.height/2), y: size.height + nonCharacterFlowersPetals.size.height/2)
        nonCharacterFlowersPetals.size = CGSize(width: 70, height: 100)
        nonCharacterFlowersPetals.zPosition = 1.5
        addChild(nonCharacterFlowersPetals)
        
        let actionRainyFlowersPetals = SKAction.moveTo(y: -nonCharacterFlowersPetals.size.width/2, duration: 8.0)
        let actionRemoveFlowersPetals = SKAction.removeFromParent()
        
        nonCharacterFlowersPetals.run(SKAction.sequence([actionRainyFlowersPetals, actionRemoveFlowersPetals]))
    }
    
    func buttonNextScene() {
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run(SKAction.repeatForever(buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene9(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonPreviousScene() {
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            buttonPrevious.run(SKAction.repeatForever(buttonPreviousAction!), withKey: "Button Previous")
            let reveal = SKTransition.reveal(with: .right, duration: 1)
            let prevScene = MalinKundang_Scene7(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
    func buttonHomeScene() {
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            let prevScene = HomePage_ViewController(nibName: "HomePage_ViewController", bundle: nil)
            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        if atPoint((touch?.location(in: self))!).name == buttonNext.name {
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