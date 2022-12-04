//
//  MalinKundang_Scene6.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 21/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene6: SKScene {
    
    let backgroundScene6 = SKSpriteNode(imageNamed: "backgroundScene6")
    
    let kayuScene6 = SKSpriteNode(imageNamed: "kayuScene6")
    
    let characterMalin = SKSpriteNode(imageNamed: "malinScene1_1")
    var animationMalin: SKAction?
    
    let kapalScene6 = SKSpriteNode(imageNamed: "kapalScene6_1")
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene6_1")
    var animationIbuMalin: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        
        // MARK: Default background white
        self.backgroundColor = SKColor.white
        
        backgroundScene6.size = CGSize(width: 2050, height: 1120)
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
        
        kayuScene6.size = CGSize(width: 1100, height: 270)
        kayuScene6.position = CGPoint(x: size.width/2.2, y: size.height/3.6)
        kayuScene6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        kayuScene6.zPosition = 3
        addChild(kayuScene6)
        
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
        buttonHome.zPosition = 4
        addChild(buttonHome)
        

    }
    
    //MARK: SOURCE CODE ASSET GERAK
    override init(size: CGSize){
        
        var textures1: [SKTexture] = []
        for index in 1...2 {
            textures1.append(SKTexture(imageNamed: "ibuMalinScene6_\(index)"))
        }
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        animationIbuMalin = SKAction.animate(with: textures1, timePerFrame: 0.3)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene7(size: CGSize(width: 2048, height: 1536))
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
            let prevScene = MalinKundang_Puzzle2(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
    func buttonHomeScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
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
    
    override func update(_ currentTime: TimeInterval) {
        startIbuMalinAnimation()
    }
}
