//
//  MalinKundang_Scene7.swift
//  Folka
//
//  Created by Ferry Julian on 23/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene7: SKScene {
    
    let fieldBackground = SKSpriteNode(imageNamed: "backgroundField")
    
    let characterMalin = SKSpriteNode(imageNamed: "malinScene7_1")
    var animationMalin: SKAction?
    
    let nonCharacterHome = SKSpriteNode(imageNamed: "homeMalin1")
    var animationHome: SKAction?
    
    let nonCharacterBabyChick = SKSpriteNode(imageNamed: "babyChicken")
    var animationBabyChick: SKAction?
    
    let nonCharacterMomChick = SKSpriteNode(imageNamed: "mommyChicken")
    var animationMomChick: SKAction?
    
    let nonCharacterHomeChick = SKSpriteNode(imageNamed: "homeChicken")
    
    let nonCharacterChickFeed = SKSpriteNode(imageNamed: "chickenFeed")
    
    let nonCharacterAppleTree = SKSpriteNode(imageNamed: "appleTree1")
    var animationAppleTree: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let textLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        fieldBackground.size = CGSize(width: 2060, height: 1120)
        fieldBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        fieldBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fieldBackground.zPosition = 0
        addChild(fieldBackground)
        
        nonCharacterHome.name = "homeMalin"
        nonCharacterHome.size = CGSize(width: 1080, height: 550)
        nonCharacterHome.position = CGPoint(x: size.width/2.0, y: size.height/1.65)
        nonCharacterHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHome.zPosition = 1
        addChild(nonCharacterHome)
        
        nonCharacterAppleTree.name = "appleTree"
        nonCharacterAppleTree.size = CGSize(width: 280, height: 350)
        nonCharacterAppleTree.position = CGPoint(x: size.width/7.0, y: size.height/1.9)
        nonCharacterAppleTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterAppleTree.zPosition = 1
        addChild(nonCharacterAppleTree)
        
        nonCharacterHomeChick.name = "homeChick"
        nonCharacterHomeChick.size = CGSize(width: 150, height: 210)
        nonCharacterHomeChick.position = CGPoint(x: size.width/1.25, y: size.height/1.85)
        nonCharacterHomeChick.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHomeChick.zPosition = 1
        addChild(nonCharacterHomeChick)
        
        nonCharacterChickFeed.name = "feedChick"
        nonCharacterChickFeed.size = CGSize(width: 200, height: 200)
        nonCharacterChickFeed.position = CGPoint(x: size.width/1.18, y: size.height/2.7)
        nonCharacterChickFeed.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterChickFeed.zPosition = 1
        addChild(nonCharacterChickFeed)
        
        nonCharacterBabyChick.name = "babyChick"
        nonCharacterBabyChick.size = CGSize(width: 80, height: 80)
        nonCharacterBabyChick.position = CGPoint(x: size.width/1.25, y: size.height/2.6)
        nonCharacterBabyChick.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBabyChick.zPosition = 1.5
        addChild(nonCharacterBabyChick)
        
        nonCharacterMomChick.name = "momChick"
        nonCharacterMomChick.size = CGSize(width: 150, height: 120)
        nonCharacterMomChick.position = CGPoint(x: size.width/1.1, y: size.height/2.3)
        nonCharacterMomChick.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterMomChick.zPosition = 1.5
        addChild(nonCharacterMomChick)
        
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 200, height: 450)
        characterMalin.position = CGPoint(x: size.width/1.35, y: size.height/2.3)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 1.5
        addChild(characterMalin)
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 150, height: 150)
        buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = 2
        addChild(buttonNext)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 150, height: 150)
        buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = 2
        addChild(buttonPrevious)
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 2
        addChild(buttonHome)
        
        textLayout.size = CGSize(width: 1300, height: 200)
        textLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        textLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        textLayout.zPosition = 2
        addChild(textLayout)
        
        labelTextStory.text = "Di pulau baru, Malin bekerja keras dan menjadi orang kaya."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1300
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/3.8)
        labelTextStory.zPosition = 2.5
        addChild(labelTextStory)
        
    }
    
    override init(size: CGSize){
        var texturesApple: [SKTexture] = []
        for index in 1...3 {
            texturesApple.append(SKTexture(imageNamed: "appleTree\(index)"))
        }
        
        var texturesMalin: [SKTexture] = []
        for index in 1...2 {
            texturesMalin.append(SKTexture(imageNamed: "malinScene7_\(index)"))
        }
        
        var texturesHomeMalin: [SKTexture] = []
        for index in 1...2 {
            texturesHomeMalin.append(SKTexture(imageNamed: "homeMalin\(index)"))
        }
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        animationAppleTree = SKAction.animate(with: texturesApple, timePerFrame: 0.3)
        animationMalin = SKAction.animate(with: texturesMalin, timePerFrame: 0.3)
        animationHome = SKAction.animate(with: texturesHomeMalin, timePerFrame: 0.5)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonHomeScene() {
        if stateMusic {
            run(clickButton)
        }
        
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
//            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
//            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
        }
    }
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene8(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonPreviousScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            let reveal = SKTransition.reveal(with: .right, duration: 1)
            let prevScene = MalinKundang_Scene6(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
    func startMalinAnimation() {
        if characterMalin.action(forKey: "Malin") == nil {
            characterMalin.run(SKAction.repeatForever(animationMalin!), withKey: "Malin")
        }
    }
    
    func stopMalinAnimation() {
        characterMalin.removeAction(forKey: "Malin")
    }
    
    func startHomeMalinAnimation() {
        if nonCharacterHome.action(forKey: "Home Malin") == nil {
            nonCharacterHome.run(SKAction.repeatForever(animationHome!), withKey: "Home Malin")
        }
    }
    
    func stopHomeMalinAnimation() {
        nonCharacterHome.removeAction(forKey: "Home Malin")
    }
    
    func startAppleTreeAnimation() {
        if nonCharacterAppleTree.action(forKey: "Apple Tree") == nil {
            nonCharacterAppleTree.run(SKAction.repeatForever(animationAppleTree!), withKey: "Apple Tree")
        }
    }
    
    func stopAppleTreeAnimation() {
        nonCharacterAppleTree.removeAction(forKey: "Apple Tree")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
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
        }else if atPoint((touch?.location(in: self))!).name == nonCharacterAppleTree.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.nonCharacterAppleTree.hasActions(){
                    if node.name == "appleTree" {
                        startAppleTreeAnimation()
                    }
                }else{
                    if node.name == "appleTree" {
                        stopAppleTreeAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == nonCharacterHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.nonCharacterHome.hasActions(){
                    if node.name == "homeMalin" {
                        startHomeMalinAnimation()
                    }
                }else{
                    if node.name == "homeMalin" {
                        stopHomeMalinAnimation()
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
