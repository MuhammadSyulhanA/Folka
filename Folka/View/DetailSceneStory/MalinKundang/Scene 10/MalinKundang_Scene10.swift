//
//  MalingKundang_Scene10.swift
//  Folka
//
//  Created by M. Syulhan Al Ghofany on 28/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene10: SKScene {
    
    //MARK: Library sesuaikan dengan framework
    let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
    let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
    
    let characterMalinBadan = SKSpriteNode(imageNamed: "badanMalinScene10")
    var animationMalinBadan: SKAction?
    
    let characterMalinKepala = SKSpriteNode(imageNamed: "kepalaMalinScene10_1")
    var animationMalinKepala: SKAction?
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene10")
    
    let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
    var animationTree: SKAction?
    
    let nonCharacterMindBox = SKSpriteNode(imageNamed: "mindPopUpScene10")
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        // MARK: Default background white
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
        
        nonCharacterSea.size = CGSize(width: 2050, height: 1120)
        nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 0
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        nonCharacterMindBox.size = CGSize(width: 1000, height: 1400)
        nonCharacterMindBox.position = CGPoint(x: size.width/1.85, y: size.height/1.65)
        nonCharacterMindBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterMindBox.zPosition = 1.5
        addChild(nonCharacterMindBox)
        
        characterMalinBadan.name = "malinBadan"
        characterMalinBadan.size = CGSize(width: 700, height: 1100)
        characterMalinBadan.position = CGPoint(x: size.width/1.8, y: size.height/2.08)
        characterMalinBadan.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinBadan.zPosition = 3.5
        addChild(characterMalinBadan)
        
        characterMalinKepala.name = "malinKepala"
        characterMalinKepala.size = CGSize(width: 700, height: 1100)
        characterMalinKepala.position = CGPoint(x: size.width/1.8, y: size.height/2.1)
        characterMalinKepala.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinKepala.zPosition = 2
        addChild(characterMalinKepala)
        
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 1300, height: 2000)
        characterIbuMalin.position = CGPoint(x: size.width/2.7, y: size.height/6.0)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 2
        addChild(characterIbuMalin)
        
        nonCharacterTree.name = "tree"
        nonCharacterTree.size = CGSize(width: 450, height: 700)
        nonCharacterTree.position = CGPoint(x: size.width/13.0, y: size.height/2.6)
        nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTree.zPosition = 3.5
        nonCharacterTree.zRotation = CGFloat.pi / -23
        addChild(nonCharacterTree)
        
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
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        labelTextStory.text = "Setiap hari Mande Rubayah selalu menunggu Malin pulang karena merasa kangen."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1320
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
        labelTextStory.zPosition = +4.5
        addChild(labelTextStory)
        
        Sound.sharedInstance.playDubbing(file: "10", fileExtension: "m4a")
    }
    
    //MARK: SOURCE CODE ASSET GERAK
    override init(size: CGSize){
        var textures: [SKTexture] = []
        for index in 1...2 {
            textures.append(SKTexture(imageNamed: "kepalaMalinScene10_\(index)"))
        }
        
        var textures2: [SKTexture] = []
        for index in 1...2 {
            textures2.append(SKTexture(imageNamed: "tree\(index)"))
        }
        
        var textures3: [SKTexture] = []
        for index in 1...2 {
            textures3.append(SKTexture(imageNamed: "house\(index)"))
        }
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        animationMalinKepala = SKAction.animate(with: textures, timePerFrame: 0.3)
        animationTree = SKAction.animate(with: textures2, timePerFrame: 0.5)
        
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
            let prevScene = MalinKundang_Scene9(size: CGSize(width: 2048, height: 1536))
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
    
    func startMalinAnimation() {
        if characterMalinBadan.action(forKey: "Badan Malin") == nil {
            characterMalinBadan.run(SKAction.repeatForever(animationMalinKepala!), withKey: "Badan Malin")
        }
    }

    func stopMalinAnimation() {
        characterMalinBadan.removeAction(forKey: "Badan Malin")
    }
    
    func stopIbuMalinAnimation() {
        characterIbuMalin.removeAction(forKey: "Ibu Malin Scene1")
    }
    
    func startTreeAnimation() {
        if nonCharacterTree.action(forKey: "Tree") == nil {
            nonCharacterTree.run(SKAction.repeatForever(animationTree!), withKey: "Tree")
        }
    }
    
    func stopTreeAnimation() {
        nonCharacterTree.removeAction(forKey: "Tree")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == characterMalinBadan.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.characterMalinBadan.hasActions(){
                    if node.name == "malinBadan" {
                        startMalinAnimation()
                    }

                } else{
                    if node.name == "malinBadan" {
                        stopMalinAnimation()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == nonCharacterTree.name {
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
        } else if atPoint((touch?.location(in: self))!).name == buttonNext.name {
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
