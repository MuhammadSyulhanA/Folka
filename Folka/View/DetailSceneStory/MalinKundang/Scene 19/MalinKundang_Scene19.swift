//
//  MalinKundang_Scene19.swift
//  Folka
//
//  Created by Ferry Julian on 01/12/22.
//

import SpriteKit
import GameplayKit

//MARK: STRUCT FOR TEXT SCENE
struct Script19 {
    var text: String!
}

class MalinKundang_Scene19: SKScene {
    //MARK: BACKGROUND
    let backgroundEnding = SKSpriteNode(imageNamed: "backgroundEnding")
    
    //MARK: NON CHARACTER
    let nonCharacterSea = SKSpriteNode(imageNamed: "seaEnding")
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "coconutTree")
    var animationTree: SKAction?
    
    let nonCharacterCoconut = SKSpriteNode(imageNamed: "coconut")
    var animationCoconut: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    var dataIntro: [Script19] = []
    var state = 0
    
    //MARK: CHARACTER
    let characterMalin = SKSpriteNode(imageNamed: "malinScene19_1")
    var animationMalin: SKAction?
    
    //MARK: BUTTON
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    
    //MARK: SOUND/MUSIC
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        //MARK: INIZIALITATION BACKGROUND
        let rect = CGRect(x: 0, y: 0, width: 100, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        self.backgroundColor = SKColor.white
        
        backgroundEnding.size = CGSize(width: 2050, height: 1120)
        backgroundEnding.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundEnding.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundEnding.zPosition = 0
        addChild(backgroundEnding)
        
        //MARK: INIZIALITATION NON CHARACTER
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
        
        nonCharacterTextLayout.size = CGSize(width: 1300, height: 200)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = 3
        addChild(nonCharacterTextLayout)
        
        //MARK: INIZIALITATION CHARACTER
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 450, height: 250)
        characterMalin.position = CGPoint(x: size.width/2.1, y: size.height/2.4)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
        //MARK: INITIALIZATION TEXT
        let data1 = Script19(text: "Ia menangis dan menyesali perbuatannya pada ibunya tadi.")
        let data2 = Script19(text: "Namun sudah terlambat, Malin kemudian berubah menjadi batu karena perbuatannya.")
        
        dataIntro = [data1, data2]
        
        labelTextStory.text = dataIntro[0].text
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.verticalAlignmentMode = .center
        labelTextStory.preferredMaxLayoutWidth = 1235
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/3.5)
        labelTextStory.zPosition = 3.5
        addChild(labelTextStory)
        
        //MARK: INIZIALITATION BUTTON
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
        
        //MARK: INIZIALITATION SOUND AND MUSIC
        Sound.sharedInstance.playDubbing(file: "19 1", fileExtension: "m4a")
        if UserDefaults.standard.bool(forKey: "fxMusic") {
            Sound.sharedInstance.playBacksound(file: "soundMalinBecomesStone", fileExtension: "mp3")
        }
        
        startMalinStoneAnimation()
    }
    
    override init(size: CGSize){
        //MARK: SK ACTION BUTTON
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        //MARK: SK ACTION NON CHARACTER
        animationTree = SKAction.scale(to: 1.0, duration: 2.0)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: FUNCTION CHARACTER FOR MALIN INTO STONE
    func startMalinStoneAnimation() {
        var texturesMalin: [SKTexture] = []
        for index in 1...5 {
            texturesMalin.append(SKTexture(imageNamed: "malinScene19_\(index)"))
        }
        if characterMalin.action(forKey: "Malin Animation") == nil {
            characterMalin.run(SKAction.animate(with: texturesMalin, timePerFrame: 3.0), withKey: "Malin Animation")
        }
    }
    
    //MARK: FUNCTION NON CHARACTER
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
    
    //MARK: FUNCTION BUTTON NEXT
    func buttonNextScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "19 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalingKundang_ChoicesEnding(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
                
            }
        } else {
            state += 1
            if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalingKundang_ChoicesEnding(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            } else if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "19 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            }
        }
    }
    
    //MARK: FUNCTION BUTTON PREVIOUS
    func buttonPreviousScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            state -= 1
            if state == 0 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "19 1", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "19 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == -1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
        } else {
            state -= 1
            if state == -1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            } else if state == 0 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "19 1", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            }
        }
    }
    
    //MARK: FUNCTION BUTTON HOME
    func buttonHomeScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        
        if buttonHome.action(forKey: "Button Home") == nil {
            Sound.sharedInstance.stop()
            Sound.sharedInstance.stopBacksound()
            if UserDefaults.standard.bool(forKey: "fxMusic") {
                Sound.sharedInstance.playBacksound(file: "startGame", fileExtension: "wav")
            }
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
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
