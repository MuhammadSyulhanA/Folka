//
//  MalinKundang_Scene19.swift
//  Folka
//
//  Created by Ferry Julian on 01/12/22.
//

import SpriteKit
import GameplayKit

struct Script19 {
    var text: String!
}

class MalinKundang_Scene19: SKScene {
    
    let backgroundEnding = SKSpriteNode(imageNamed: "backgroundEnding")
    
    let nonCharacterSea = SKSpriteNode(imageNamed: "seaEnding")
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "coconutTree")
    var animationTree: SKAction?
    
    let nonCharacterCoconut = SKSpriteNode(imageNamed: "coconut")
    var animationCoconut: SKAction?
    
    let characterMalin = SKSpriteNode(imageNamed: "malinScene19_1")
    var animationMalin: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    var dataIntro: [Script19] = []
    var state = 0
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        let data1 = Script19(text: "Ia menangis dan menyesali perbuatannya pada ibunya tadi.")
        let data2 = Script19(text: "Namun sudah terlambat, Malin kemudian berubah menjadi batu karena perbuatannya.")
        
        dataIntro = [data1, data2]
        
        self.backgroundColor = SKColor.white
        
        backgroundEnding.size = CGSize(width: 2050, height: 1120)
        backgroundEnding.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundEnding.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundEnding.zPosition = 0
        addChild(backgroundEnding)
        
        nonCharacterSea.size = CGSize(width: 600, height: 490)
        nonCharacterSea.position = CGPoint(x: size.width/12.0, y: size.height/3.4)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 1
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        nonCharacterTree.size = CGSize(width: 430, height: 600)
        nonCharacterTree.position = CGPoint(x: size.width/1.25, y: size.height/1.68)
        nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTree.zPosition = 1
        addChild(nonCharacterTree)
        
        nonCharacterCoconut.size = CGSize(width: 130, height: 60)
        nonCharacterCoconut.position = CGPoint(x: size.width/1.24, y: size.height/1.5)
        nonCharacterCoconut.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterCoconut.zPosition = 1.25
        nonCharacterCoconut.isHidden = true
        addChild(nonCharacterCoconut)
        
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 450, height: 250)
        characterMalin.position = CGPoint(x: size.width/2.1, y: size.height/2.4)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
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
        
        nonCharacterTextLayout.size = CGSize(width: 1300, height: 200)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = 3
        addChild(nonCharacterTextLayout)
        
        labelTextStory.text = dataIntro[0].text
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1235
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.08)
        labelTextStory.zPosition = 3.5
        addChild(labelTextStory)
        
        startMalinStoneAnimation()
    }
    
    override init(size: CGSize){
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        animationTree = SKAction.scale(to: 1.0, duration: 2.0)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMalinStoneAnimation() {
        var texturesMalin: [SKTexture] = []
        for index in 1...5 {
            texturesMalin.append(SKTexture(imageNamed: "malinScene19_\(index)"))
        }
        if characterMalin.action(forKey: "Malin Animation") == nil {
            characterMalin.run(SKAction.animate(with: texturesMalin, timePerFrame: 2.0), withKey: "Malin Animation")
        }
    }
    
    func startCoconutAnimation() {
        if nonCharacterTree.action(forKey: "Coconut Animation") == nil {
            nonCharacterTree.run(SKAction.repeatForever(animationTree!), withKey: "Coconut Animation")
            nonCharacterCoconut.isHidden = false
            nonCharacterCoconut.run(SKAction.move(to: CGPoint(x: size.width/1.24, y: size.height/2.68), duration: 3.0))
        }
    }
    
    func stopCoconutAnimation() {
        nonCharacterCoconut.position = CGPoint(x: size.width/1.24, y: size.height/1.5)
        nonCharacterCoconut.isHidden = true
        nonCharacterTree.removeAction(forKey: "Coconut Animation")
    }
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            if state == 1 {
                labelTextStory.text = dataIntro[state].text
            } else if state == 2 {
                let prevScene = ChoiceEndingViewController(nibName: "ChoiceEndingViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            }
        } else {
            state += 1
            if state == 2 {
                let prevScene = ChoiceEndingViewController(nibName: "ChoiceEndingViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            } else if state == 1 {
                labelTextStory.text = dataIntro[state].text
            }
        }
    }
    
    func buttonPreviousScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            state -= 1
            if state == 0 {
                labelTextStory.text = dataIntro[state].text
            } else if state == 1 {
                labelTextStory.text = dataIntro[state].text
            } else if state == -1 {
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
        } else {
            state -= 1
            if state == -1 {
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            } else if state == 0 {
                labelTextStory.text = dataIntro[state].text
            }
        }
    }
    
    func buttonHomeScene() {
        if stateMusic {
            run(clickButton)
        }
        
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == nonCharacterTree.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.nonCharacterTree.hasActions(){
                    if node.name == "tree" {
                        startCoconutAnimation()
                    }
                } else{
                    if node.name == "tree" {
                        stopCoconutAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonNext.hasActions(){
                    if node.name == "buttonNext" {
                        buttonNextScene()
                    }
                } else {
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
        
    }
}
