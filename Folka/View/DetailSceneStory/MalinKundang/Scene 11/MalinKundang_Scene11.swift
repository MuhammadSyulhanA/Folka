//
//  MalinKundang_Scene11.swift
//  Folka
//
//  Created by M. Syulhan Al Ghofany on 28/11/22.
//

import SpriteKit
import GameplayKit

struct Script11 {
    var text: String!
}

class MalinKundang_Scene11: SKScene {
    
    //MARK: Background
    let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
    let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
    
    //MARK: Character
    let characterIbuMalin = SKSpriteNode(imageNamed: "malinMomScene11_1")
    var animationIbuMalin: SKAction?
    
    let characterNahkoda = SKSpriteNode(imageNamed: "sailorScene11_1")
    var animationNahkoda: SKAction?
    
    //MARK: Non Character
    let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
    
    let nonCharacterHouse = SKSpriteNode(imageNamed: "house1")
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
    var animationTree: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    
    //MARK: Button
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    //MARK: Label
    var labelTextStory = SKLabelNode(fontNamed: "Nunito")
    var dataIntro: [Script11] = []
    var state = 0
    
    //MARK: SOUND
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: 0, y: 0, width: 200, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        //MARK: Initializer Array for Data Label
        let data1 = Script11(text: "Tiba-tiba ia didatangi oleh kru kapal yang dulu berlayar dengan Malin.")
        let data2 = Script11(text: "Ia membawa kabar bahwa Malin akan kembali pulang.")
        let data3 = Script11(text: "Mande Rubayah sangat senang mendengar kabar itu.")
        
        dataIntro = [data1, data2, data3]
        
        //MARK: Background
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
        
        //MARK: Non Character
        nonCharacterSea.size = CGSize(width: 2050, height: 1120)
        nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 0
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        nonCharacterHouse.name = "house"
        nonCharacterHouse.size = CGSize(width: 300, height: 250)
        nonCharacterHouse.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
        nonCharacterHouse.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHouse.zPosition = 1.25
        addChild(nonCharacterHouse)
        
        nonCharacterTree.name = "tree"
        nonCharacterTree.size = CGSize(width: 450, height: 700)
        nonCharacterTree.position = CGPoint(x: size.width/13.0, y: size.height/2.6)
        nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTree.zPosition = 3.5
        nonCharacterTree.zRotation = CGFloat.pi / -23
        addChild(nonCharacterTree)
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        //MARK: Character
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 1300, height: 2000)
        characterIbuMalin.position = CGPoint(x: size.width/2.7, y: size.height/6.0)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 3
        addChild(characterIbuMalin)
        
        characterNahkoda.name = "nahkoda"
        characterNahkoda.size = CGSize(width: 1500, height: 2200)
        characterNahkoda.position = CGPoint(x: size.width/1.5, y: size.height/8.0)
        characterNahkoda.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterNahkoda.zPosition = 2
        addChild(characterNahkoda)
        
        //MARK: Button
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
        
        //MARK: Label
        labelTextStory.text = dataIntro[0].text
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1320
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.0)
        labelTextStory.zPosition = +4.5
        addChild(labelTextStory)
        
        //MARK: Sound
        Sound.sharedInstance.playDubbing(file: "11 1", fileExtension: "m4a")
    }
    
    //MARK: SOURCE CODE MOVE ASSET
    override init(size: CGSize){
        //MARK: Actived Texture
        var textures: [SKTexture] = []
        for index in 1...2 {
            textures.append(SKTexture(imageNamed: "malinMomScene11_\(index)"))
        }
        
        var textures2: [SKTexture] = []
        for index in 1...2 {
            textures2.append(SKTexture(imageNamed: "tree\(index)"))
        }
        
        var textures3: [SKTexture] = []
        for index in 1...2 {
            textures3.append(SKTexture(imageNamed: "house\(index)"))
        }
        
        var textures4: [SKTexture] = []
        for index in 1...2 {
            textures4.append(SKTexture(imageNamed: "sailorScene11_\(index)"))
        }
        
        //MARK: Action Animation
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        animationIbuMalin = SKAction.animate(with: textures, timePerFrame: 0.3)
        animationNahkoda = SKAction.animate(with: textures4, timePerFrame: 0.3)
        animationTree = SKAction.animate(with: textures2, timePerFrame: 0.5)
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
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
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
            Sound.sharedInstance.stop()
        }
    }
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 3", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 3 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene12(size: CGSize(width: 2050, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
        } else {
            state += 1
            if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 3", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 3 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene12(size: CGSize(width: 2050, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
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
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 1", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 3", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == -1 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let prevScene = MalinKundang_Scene10(size: CGSize(width: 2048, height: 1536))
                prevScene.scaleMode = .aspectFill
                scene?.view!.presentScene(prevScene, transition: reveal)
            }
        } else {
            state -= 1
            if state == 0 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 1", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 1 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 2", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == 2 {
                Sound.sharedInstance.stop()
                Sound.sharedInstance.playDubbing(file: "11 3", fileExtension: "m4a")
                labelTextStory.text = dataIntro[state].text
            } else if state == -1 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let prevScene = MalinKundang_Scene10(size: CGSize(width: 2048, height: 1536))
                prevScene.scaleMode = .aspectFill
                scene?.view!.presentScene(prevScene, transition: reveal)
            }
        }
    }
    
    func startIbuMalinAnimation() {
        if characterIbuMalin.action(forKey: "Ibu Malin") == nil {
            characterIbuMalin.run(SKAction.repeatForever(animationIbuMalin!), withKey: "Ibu Malin")
        }
    }
    
    func stopIbuMalinAnimation() {
        characterIbuMalin.removeAction(forKey: "Ibu Malin")
    }
    
    func startNahkodaAnimation() {
        if characterNahkoda.action(forKey: "Nahkoda") == nil {
            characterNahkoda.run(SKAction.repeatForever(animationNahkoda!), withKey: "Nahkoda")
        }
    }
    
    func stopNahkodaAnimation() {
        characterNahkoda.removeAction(forKey: "Nahkoda")
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
        if atPoint((touch?.location(in: self))!).name == characterIbuMalin.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.characterIbuMalin.hasActions(){
                    if node.name == "ibuMalin" {
                        startIbuMalinAnimation()
                    }
                    
                } else{
                    if node.name == "ibuMalin" {
                        stopIbuMalinAnimation()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == characterNahkoda.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.characterNahkoda.hasActions(){
                    if node.name == "nahkoda" {
                        startNahkodaAnimation()
                    }
                } else{
                    if node.name == "nahkoda" {
                        stopNahkodaAnimation()
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
                if !self.buttonPrevious.hasActions(){
                    if node.name == "buttonNext" {
                        run(clickButton)
                        buttonNextScene()
                    }
                } else {
                    if node.name == "buttonNext" {
                        run(clickButton)
                        buttonNextScene()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonPrevious.hasActions(){
                    if node.name == "buttonPrevious" {
                        run(clickButton)
                        buttonPreviousScene()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonHome.hasActions(){
                    if node.name == "buttonHome" {
                        Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
                        run(clickButton)
                        buttonHomeScene()
                    }
                }
            }
        }
    }
}
