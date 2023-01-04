//
//  MalinKundang_Scene17.swift
//  Folka
//
//  Created by Ferry Julian on 30/11/22.
//

import SpriteKit
import GameplayKit

//MARK: STRUCT FOR TEXT SCENE
struct Script17 {
    var textDialogue: String!
}

class MalinKundang_Scene17: SKScene {
    //MARK: BACKGROUND
    let backgroundSky = SKSpriteNode(imageNamed: "darkSkyBackground")
    
    let backgroundWaveGround = SKSpriteNode(imageNamed: "waveGroundBackground1")
    var animationWaveGround: SKAction?
    
    let backgroundWaveMiddle = SKSpriteNode(imageNamed: "waveMiddleBackground1")
    var animationWaveMiddle: SKAction?
    
    let backgroundWaveTop = SKSpriteNode(imageNamed: "waveTopBackground1")
    var animationWaveTop: SKAction?
    
    //MARK: NON CHARACTER
    let nonCharacterCloud = SKSpriteNode(imageNamed: "cloudThunder1")
    var animationCloud: SKAction?
    
    let nonCharacterBoat = UserDefaults.standard.string(forKey: "kapalPilih")! == "objectKapalSatu" ? SKSpriteNode(imageNamed: "boatScene17_1") : SKSpriteNode(imageNamed: "boat2Scene17_1")
    var animationBoat: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    var dataIntro: [Script17] = []
    var state = 0
    
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
        self.backgroundColor = SKColor.white
        
        backgroundSky.size = CGSize(width: 2050, height: 1120)
        backgroundSky.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSky.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSky.zPosition = 0
        addChild(backgroundSky)
        
        backgroundWaveGround.size = CGSize(width: 2050, height: 1120)
        backgroundWaveGround.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundWaveGround.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundWaveGround.zPosition = 1.3
        addChild(backgroundWaveGround)
        
        backgroundWaveMiddle.size = CGSize(width: 2050, height: 1120)
        backgroundWaveMiddle.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundWaveMiddle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundWaveMiddle.zPosition = 1.25
        addChild(backgroundWaveMiddle)
        
        backgroundWaveTop.size = CGSize(width: 2050, height: 1120)
        backgroundWaveTop.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundWaveTop.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundWaveTop.zPosition = 1.0
        addChild(backgroundWaveTop)
        
        //MARK: INIZIALITATION NON CHARACTER
        nonCharacterCloud.size = CGSize(width: 2030, height: 1020)
        nonCharacterCloud.position = CGPoint(x: size.width/2, y: size.height/1.9)
        nonCharacterCloud.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterCloud.zPosition = 1.5
        addChild(nonCharacterCloud)
        
        nonCharacterBoat.size = CGSize(width: 550, height: 350)
        nonCharacterBoat.position = CGPoint(x: size.width/2, y: size.height/2.1)
        nonCharacterBoat.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBoat.zPosition = 1.7
        addChild(nonCharacterBoat)
        
        nonCharacterTextLayout.size = CGSize(width: 1300, height: 200)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = 3
        addChild(nonCharacterTextLayout)
        
        //MARK: INITIALIZATION TEXT
        let data1 = Script17(textDialogue: "Seketika badai datang dan kapal Malin terombang-ambing.")
        let data2 = Script17(textDialogue: "Kapal Malin kemudian menabrak batu hingga hancur.")
        
        dataIntro = [data1, data2]
        
        labelTextStory.text = dataIntro[0].textDialogue
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1235
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/3.8)
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
        Sound.sharedInstance.playBacksound(file: "rainThunder", fileExtension: "mp3")
        Sound.sharedInstance.playDubbing(file: "17 1", fileExtension: "m4a")
    }
    
    override init(size: CGSize){
        //MARK: TEXTURE FOR SEA WAVE
        var texturesWaveTop: [SKTexture] = []
        for index in 1...2 {
            texturesWaveTop.append(SKTexture(imageNamed: "waveTopBackground\(index)"))
        }
        
        var texturesWaveMiddle: [SKTexture] = []
        for index in 1...2 {
            texturesWaveMiddle.append(SKTexture(imageNamed: "waveMiddleBackground\(index)"))
        }
        
        var texturesWaveGround: [SKTexture] = []
        for index in 1...2 {
            texturesWaveGround.append(SKTexture(imageNamed: "waveGroundBackground\(index)"))
        }
        
        //MARK: TEXTURE FOR CLOUD
        var texturesCloud: [SKTexture] = []
        for index in 1...2 {
            texturesCloud.append(SKTexture(imageNamed: "cloudThunder\(index)"))
        }
        
        //MARK: TEXTURE FOR BOAT
        var texturesBoat: [SKTexture] = []
        if (UserDefaults.standard.string(forKey: "kapalPilih")! == "objectKapalSatu") {
            for index in 1...2 {
                texturesBoat.append(SKTexture(imageNamed: "boatScene17_\(index)"))
            }
        } else {
            for index in 1...2 {
                texturesBoat.append(SKTexture(imageNamed: "boat2Scene17_\(index)"))
            }
        }
        
        //MARK: SK ACTION BUTTON
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        //MARK: SK ACTION BACKGROUND
        animationWaveTop = SKAction.animate(with: texturesWaveTop, timePerFrame: 0.7)
        animationWaveMiddle = SKAction.animate(with: texturesWaveMiddle, timePerFrame: 0.7)
        animationWaveGround = SKAction.animate(with: texturesWaveGround, timePerFrame: 0.7)
        animationCloud = SKAction.animate(with: texturesCloud, timePerFrame: 0.7)
        animationBoat = SKAction.animate(with: texturesBoat, timePerFrame: 0.7)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: FUNCTION FOR ANIMATION BACKGROUND
    func startCloudAnimation() {
        if nonCharacterCloud.action(forKey: "Cloud Animation") == nil {
            nonCharacterCloud.run(SKAction.repeatForever(animationCloud!), withKey: "Cloud Animation")
        }
    }
    
    func startWaveTopAnimation() {
        if backgroundWaveTop.action(forKey: "Wave Top Animation") == nil {
            backgroundWaveTop.run(SKAction.repeatForever(animationWaveTop!), withKey: "Wave Top Animation")
        }
    }
    
    func startWaveMiddleAnimation() {
        if backgroundWaveMiddle.action(forKey: "Wave Middle Animation") == nil {
            backgroundWaveMiddle.run(SKAction.repeatForever(animationWaveMiddle!), withKey: "Wave Middle Animation")
        }
    }
    
    func startWaveGroundAnimation() {
        if backgroundWaveGround.action(forKey: "Wave Ground Animation") == nil {
            backgroundWaveGround.run(SKAction.repeatForever(animationWaveGround!), withKey: "Wave Ground Animation")
        }
    }
    
    //MARK: FUNCTION FOR ANIMATION BOAT
    func startBoatAnimation() {
        if nonCharacterBoat.action(forKey: "Boat Animation") == nil {
            nonCharacterBoat.run(SKAction.repeatForever(animationBoat!), withKey: "Boat Animation")
        }
    }
    
    //MARK: FUNCTION BUTTON NEXT
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "17 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2050, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
        } else {
            state += 1
            if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.stopBacksound()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene18(size: CGSize(width: 2050, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
        }
    }
    
    //MARK: FUNCTION BUTTON HOME
    func buttonHomeScene() {
        if stateMusic {
            run(clickButton)
        }
        
        if buttonHome.action(forKey: "Button Home") == nil {
            Sound.sharedInstance.stop()
            Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
            Sound.sharedInstance.stopBacksound()
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    //MARK: FUNCTION BUTTON PREVIOUS
    func buttonPreviousScene () {
        if stateMusic {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Previous Next") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            state -= 1
            print(state)
            if state < 0 {
                Sound.sharedInstance.stopBacksound()
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene16(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 0 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "17 1", fileExtension: "m4a")
                    labelTextStory.text = dataIntro[state].textDialogue
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonNext" {
                    buttonNextScene()
                }
            }
        }
        else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
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
        startCloudAnimation()
        startWaveTopAnimation()
        startWaveMiddleAnimation()
        startWaveGroundAnimation()
        startBoatAnimation()
    }
}

