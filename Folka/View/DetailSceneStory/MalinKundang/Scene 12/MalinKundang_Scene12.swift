//
//  MalinKundang_Scene12.swift
//  Folka
//
//  Created by Ferry Julian on 26/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene12: SKScene {
    let playableRect: CGRect
    
    //MARK: Background
    let backgroundSky = SKSpriteNode(imageNamed: "backgroundPuzzle")
    let backgroundSea = SKSpriteNode(imageNamed: "backgroundOpenSea")
    
    //MARK: Non Character & Actived User Defaults
    let nonCharacterBoat1 = UserDefaults.standard.string(forKey: "pickShip")! == "objectOneShip" ? SKSpriteNode(imageNamed: "shipScene12_1") : SKSpriteNode(imageNamed: "shipScene12_2")
    var animationBoat1: SKAction!
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    
    //MARK: Button
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    //MARK: Label
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    
    //MARK: SOUND
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let path = CGPath(rect: rect, transform: nil)
        
        //MARK: Background
        self.backgroundColor = SKColor.white
        
        backgroundSky.size = CGSize(width: 2050, height: 1120)
        backgroundSky.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSky.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSky.zPosition = 0
        addChild(backgroundSky)
        
        backgroundSea.size = CGSize(width: 2050, height: 1120)
        backgroundSea.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSea.zPosition = 1
        addChild(backgroundSea)
        
        //MARK: Non Character
        nonCharacterBoat1.size = CGSize(width: 1000, height: 600)
        nonCharacterBoat1.position = CGPoint(x: size.width/2, y: size.height/2.2)
        nonCharacterBoat1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBoat1.zPosition = 1.75
        nonCharacterBoat1.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterBoat1)
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        //MARK: Button
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 150, height: 150)
        buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = 2.5
        addChild(buttonNext)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 150, height: 150)
        buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = 2.5
        addChild(buttonPrevious)
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 2.5
        addChild(buttonHome)
        
        //MARK: Label
        labelTextStory.text = "Keesokan harinya, Malin dan istrinya berlayar ke pulau asal Malin."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1300
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.0)
        labelTextStory.zPosition = +4.5
        addChild(labelTextStory)
        
        //MARK: Sound
        Sound.sharedInstance.playDubbing(file: "12 1", fileExtension: "m4a")
        if UserDefaults.standard.bool(forKey: "fxMusic") {
            Sound.sharedInstance.playBacksound(file: "soundKapalJalan", fileExtension: "wav")
        }
        
        //MARK: Action Animation
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(moveCloud), SKAction.wait(forDuration: 7.5)])))
    }
    
    //MARK: SOURCE CODE MOVE ASSET
    override init(size: CGSize) {
        //MARK: Actived Rect Size
        let maxAspectRatio:CGFloat = 10.0/3.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        //MARK: Action Animation
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveCloud() {
        let nonCharacterCloud1 = SKSpriteNode(imageNamed: "cloud1")
        nonCharacterCloud1.name = "cloud1"
        nonCharacterCloud1.position = CGPoint(x: size.width/0.9, y: size.height/1.7)
        nonCharacterCloud1.size = CGSize(width: 1000, height: 200)
        nonCharacterCloud1.zPosition = 1.5
        addChild(nonCharacterCloud1)
        
        let nonCharacterCloud2 = SKSpriteNode(imageNamed: "cloud2")
        nonCharacterCloud2.name = "cloud2"
        nonCharacterCloud2.position = CGPoint(x: size.width/0.7, y: size.height/1.35)
        nonCharacterCloud2.size = CGSize(width: 400, height: 100)
        nonCharacterCloud2.zPosition = 1.5
        addChild(nonCharacterCloud2)
        
        let nonCharacterCloud3 = SKSpriteNode(imageNamed: "cloud3")
        nonCharacterCloud3.name = "cloud3"
        nonCharacterCloud3.position = CGPoint(x: size.width/0.5, y: size.height/1.4)
        nonCharacterCloud3.size = CGSize(width: 400, height: 100)
        nonCharacterCloud3.zPosition = 1.5
        addChild(nonCharacterCloud3)
        
        let nonCharacterCloud4 = SKSpriteNode(imageNamed: "cloud4")
        nonCharacterCloud4.name = "cloud4"
        nonCharacterCloud4.position = CGPoint(x: size.width/0.4, y: size.height/1.6)
        nonCharacterCloud4.size = CGSize(width: 1000, height: 200)
        nonCharacterCloud4.zPosition = 1.5
        addChild(nonCharacterCloud4)
        
        let actionMoveCloud1 = SKAction.moveTo(x: -nonCharacterCloud1.size.width/2, duration: 6.0)
        let actionRemoveCloud1 = SKAction.removeFromParent()
        
        let actionMoveCloud2 = SKAction.moveTo(x: -nonCharacterCloud2.size.width/2, duration: 6.0)
        let actionRemoveCloud2 = SKAction.removeFromParent()
        
        let actionMoveCloud3 = SKAction.moveTo(x: -nonCharacterCloud3.size.width/2, duration: 7.0)
        let actionRemoveCloud3 = SKAction.removeFromParent()
        
        let actionMoveCloud4 = SKAction.moveTo(x: -nonCharacterCloud4.size.width/2, duration: 8.0)
        let actionRemoveCloud4 = SKAction.removeFromParent()
        
        nonCharacterCloud1.run(SKAction.sequence([actionMoveCloud1, actionRemoveCloud1]))
        nonCharacterCloud2.run(SKAction.sequence([actionMoveCloud2, actionRemoveCloud2]))
        nonCharacterCloud3.run(SKAction.sequence([actionMoveCloud3, actionRemoveCloud3]))
        nonCharacterCloud4.run(SKAction.sequence([actionMoveCloud4, actionRemoveCloud4]))
        
    }
    
    func buttonNextScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            Sound.sharedInstance.stop()
            Sound.sharedInstance.stopBacksound()
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene13(size: CGSize(width: 2048, height: 1536))
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
            Sound.sharedInstance.stopBacksound()
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            let reveal = SKTransition.reveal(with: .right, duration: 1)
            let prevScene = MalinKundang_Scene11(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
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
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonNext.hasActions(){
                    if node.name == "buttonNext" {
                        if UserDefaults.standard.bool(forKey: "fxSound") {
                            run(clickButton)
                        }
                        buttonNextScene()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonPrevious.hasActions(){
                    if node.name == "buttonPrevious" {
                        if UserDefaults.standard.bool(forKey: "fxSound") {
                            run(clickButton)
                        }
                        buttonPreviousScene()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonHome" {
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(clickButton)
                    }
                    buttonHomeScene()
                }
            }
        }
    }
}
