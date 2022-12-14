//
//  MalinKundang_Scene14.swift
//  Folka
//
//  Created by Ferry Julian on 26/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene14: SKScene {
    
    //MARK: Background
    let skyBackground = SKSpriteNode(imageNamed: "skyBackgroundZoom")
    let groundBackground = SKSpriteNode(imageNamed: "groundBackgroundZoomSea")
    
    //MARK: Non Character
    let nonCharacterSea = SKSpriteNode(imageNamed: "backgroundSeaZoom")
    let nonCharacterWood = SKSpriteNode(imageNamed: "woodScene6")
    let nonCharacterBoat1 = UserDefaults.standard.string(forKey: "pickShip")! == "objectOneShip" ? SKSpriteNode(imageNamed: "shipScene14_1") : SKSpriteNode(imageNamed: "shipScene14_2")
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    
    //MARK: Character
    let characterMalin = SKSpriteNode(imageNamed: "malinScene14_1")
    var characterMalinAnimation: SKAction?
    
    var characterIstriMalin = SKSpriteNode(imageNamed: "malinWifeScene14_1")
    var characterIstriMalinAnimation: SKAction?
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "malinMomScene14_1")
    var characterIbuMalinAnimation: SKAction?
    
    //MARK: Button
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    //MARK: Label
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    
    //MARK: Sound
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: 0, y: 0, width: 180, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        //MARK: Background
        self.backgroundColor = SKColor.white
        
        skyBackground.size = CGSize(width: 2050, height: 1120)
        skyBackground.position = CGPoint(x: size.width/2, y: size.height/2.2)
        skyBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        skyBackground.zPosition = 0.75
        addChild(skyBackground)
        
        groundBackground.size = CGSize(width: 2050, height: 1100)
        groundBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        groundBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        groundBackground.zPosition = 0
        addChild(groundBackground)
        
        //MARK: Non Character
        nonCharacterSea.size = CGSize(width: 2050, height: 1120)
        nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 0.5
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        nonCharacterWood.size = CGSize(width: 1100, height: 270)
        nonCharacterWood.position = CGPoint(x: size.width/1.5, y: size.height/3.6)
        nonCharacterWood.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterWood.zPosition = 1
        addChild(nonCharacterWood)
        
        nonCharacterBoat1.name = "kapal1"
        nonCharacterBoat1.size = CGSize(width: 800, height: 470)
        nonCharacterBoat1.position = CGPoint(x: size.width/1.02, y: size.height/2.4)
        nonCharacterBoat1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBoat1.zPosition = 0.75
        addChild(nonCharacterBoat1)
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        //MARK: Character
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 155, height: 550)
        characterMalin.position = CGPoint(x: size.width/1.5, y: size.height/2.1)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 1.5
        addChild(characterMalin)
        
        characterIstriMalin.name = "istriMalin"
        characterIstriMalin.size = CGSize(width: 170, height: 500)
        characterIstriMalin.position = CGPoint(x: size.width/1.3, y: size.height/2.3)
        characterIstriMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIstriMalin.zPosition = 1.5
        addChild(characterIstriMalin)
        
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 200, height: 480)
        characterIbuMalin.position = CGPoint(x: size.width/3, y: size.height/1.95)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 1.5
        addChild(characterIbuMalin)
        
        //MARK: Button
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
        
        //MARK: Label
        labelTextStory.text = "Setelah mereka sampai, Ibu Malin menyambut mereka dengan senang."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1300
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
        labelTextStory.zPosition = +4.5
        addChild(labelTextStory)
        
        //MARK: Sound
        Sound.sharedInstance.playDubbing(file: "14", fileExtension: "m4a")
    }
    
    //MARK: SOURCE CODE MOVE ASSET
    override init(size: CGSize){
        //MARK: Actived Textures
        var texturesIbuMalin: [SKTexture] = []
        for index in 1...3 {
            texturesIbuMalin.append(SKTexture(imageNamed: "malinMomScene14_\(index)"))
        }
        
        //MARK: Action Animation
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        characterIbuMalinAnimation = SKAction.animate(with: texturesIbuMalin, timePerFrame: 0.5)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startIbuMalinAnimation() {
        if characterIbuMalin.action(forKey: "Ibu Malin Animation") == nil {
            characterIbuMalin.run(SKAction.repeatForever(characterIbuMalinAnimation!), withKey: "Ibu Malin Animation")
        }
    }
    
    func buttonNextScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            Sound.sharedInstance.stop()
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene15(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonPreviousScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            Sound.sharedInstance.stop()
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            let reveal = SKTransition.reveal(with: .right, duration: 1)
            let prevScene = MalinKundang_Scene13(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
    func buttonHomeScene() {
        if buttonHome.action(forKey: "Button Home") == nil {
            if UserDefaults.standard.bool(forKey: "fxSound") {
                run(clickButton)
            }

            Sound.sharedInstance.stop()
            if UserDefaults.standard.bool(forKey: "fxMusic") {
                Sound.sharedInstance.playBacksound(file: "startGame", fileExtension: "wav")
            }
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first as UITouch?
        if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonNext" {
                    buttonNextScene()
                }
            }
        }
        if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonPrevious" {
                    buttonPreviousScene()
                }
            }
        }
        else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
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
