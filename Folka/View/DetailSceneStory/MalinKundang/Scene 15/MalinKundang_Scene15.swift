//
//  MalinKundang_Scene15.swift
//  Folka
//
//  Created by Ferry Julian on 30/11/22.
//

import SpriteKit
import GameplayKit

struct Script15 {
    var imageName: SKSpriteNode!
    var textDialogue: String!
}

class MalinKundang_Scene15: SKScene {
    
    //MARK: Background
    let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
    let backgroundGround = SKSpriteNode(imageNamed: "groundBackgroundZoomSea")
    
    //MARK: Character
    let characterMalin = SKSpriteNode(imageNamed: "malinScene15_1")
    var animationMalin: SKAction?
    
    var characterMalinSay = SKSpriteNode(imageNamed: "malinScene15_2")
    var animationMalinSay: SKAction?
    
    let characterIstriMalin = SKSpriteNode(imageNamed: "malinWifeScene15_1")
    var animationIstriMalin: SKAction?
    
    var characterIstriMalinSay = SKSpriteNode(imageNamed: "malinWifeScene15_2")
    var animationIstriMalinSay: SKAction?
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "malinMomScene15_1")
    var animationIbuMalin: SKAction?
    
    var characterIbuMalinSay = SKSpriteNode(imageNamed: "malinMomScene15_2")
    var animationIbuMalinSay: SKAction?
    
    //MARK: Non Character
    let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
    
    let nonCharacterHouse = SKSpriteNode(imageNamed: "house1")
    var animationHouse: SKAction?
    
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
    var dataIntro: [Script15] = []
    var state = 0
    
    //MARK: Sound
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        let rect = CGRect(x: 0, y: 0, width: 200, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        //MARK: Initializer Array for Data Label
        let data1 = Script15(imageName: characterIbuMalin, textDialogue: "Namun, Malin tidak mengakui bahwa ia adalah ibunya.")
        let data2 = Script15(imageName: characterMalinSay, textDialogue: "“Siapa kau?”")
        let data3 = Script15(imageName: characterIbuMalinSay, textDialogue: "“Malin, apakah engkau tidak mengenaliku, ibumu?”")
        let data4 = Script15(imageName: characterIstriMalinSay, textDialogue: "“Apakah benar ia ibumu?”")
        let data5 = Script15(imageName: characterMalinSay, textDialogue: "“Bukan! Aku tidak tau siapa dia.”")
        let data6 = Script15(imageName: characterMalinSay, textDialogue: "“Ayo kita pulang!”")
        let data7 = Script15(imageName: characterIbuMalinSay, textDialogue: "“Malin.. Malinn.. Malinnn!!”")
        
        dataIntro = [data1, data2, data3, data4, data5, data6, data7]
        
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
        
        //MARK: Character
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 300, height: 650)
        characterMalin.position = CGPoint(x: size.width/1.9, y: size.height/2.6)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
        characterMalinSay.name = "malinSay"
        characterMalinSay.size = CGSize(width: 300, height: 650)
        characterMalinSay.position = CGPoint(x: size.width/1.9, y: size.height/2.6)
        characterMalinSay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinSay.zPosition = 2.5
        characterMalinSay.isHidden = true
        addChild(characterMalinSay)
        
        characterIstriMalin.name = "istriMalin"
        characterIstriMalin.size = CGSize(width: 300, height: 580)
        characterIstriMalin.position = CGPoint(x: size.width/1.5, y: size.height/2.7)
        characterIstriMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIstriMalin.zPosition = 2
        addChild(characterIstriMalin)
        
        characterIstriMalinSay.name = "istriMalinSay"
        characterIstriMalinSay.size = CGSize(width: 300, height: 580)
        characterIstriMalinSay.position = CGPoint(x: size.width/1.5, y: size.height/2.7)
        characterIstriMalinSay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIstriMalinSay.zPosition = 2.5
        characterIstriMalinSay.isHidden = true
        addChild(characterIstriMalinSay)
        
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 300, height: 707)
        characterIbuMalin.position = CGPoint(x: size.width/3.33, y: size.height/2.7)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 2
        addChild(characterIbuMalin)
        
        characterIbuMalinSay.name = "ibuMalinSay"
        characterIbuMalinSay.size = CGSize(width: 300, height: 707)
        characterIbuMalinSay.position = CGPoint(x: size.width/3.33, y: size.height/2.7)
        characterIbuMalinSay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalinSay.zPosition = 2.5
        characterIbuMalinSay.isHidden = true
        addChild(characterIbuMalinSay)
        
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
        nonCharacterHouse.zPosition = 3
        addChild(nonCharacterHouse)
        
        nonCharacterTree.name = "tree"
        nonCharacterTree.size = CGSize(width: 450, height: 700)
        nonCharacterTree.position = CGPoint(x: size.width/13.0, y: size.height/2.6)
        nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTree.zPosition = 3.5
        nonCharacterTree.zRotation = CGFloat.pi / -23
        addChild(nonCharacterTree)
        
        nonCharacterTextLayout.size = CGSize(width: 1300, height: 200)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = 3
        addChild(nonCharacterTextLayout)
        
        //MARK: Button
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
        
        //MARK: Label
        labelTextStory.text = dataIntro[0].textDialogue
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1235
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/3.8)
        labelTextStory.zPosition = 3.5
        addChild(labelTextStory)
        
        //MARK: Sound
        Sound.sharedInstance.playDubbing(file: "15  1", fileExtension: "m4a")
    }
    
    //MARK: SOURCE CODE MOVE ASSET
    override init(size: CGSize){
        //MARK: Actived Textures
        var texturesTree: [SKTexture] = []
        for index in 1...2 {
            texturesTree.append(SKTexture(imageNamed: "tree\(index)"))
        }
        
        //MARK: Action Animation
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonNextAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonPreviousAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        animationTree = SKAction.animate(with: texturesTree, timePerFrame: 0.5)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTreeAnimation() {
        if nonCharacterTree.action(forKey: "Tree Animation") == nil {
            nonCharacterTree.run(SKAction.repeatForever(animationTree!), withKey: "Tree Animation")
        }
    }
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            if state == 7 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene16(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 1 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 2", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                } else if state == 2 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 3", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                } else if state == 3 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 4", fileExtension: "m4a")
                    characterIbuMalinSay.isHidden = true
                    characterIstriMalinSay.isHidden = false
                } else if state == 4 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 5", fileExtension: "m4a")
                    characterIstriMalinSay.isHidden = true
                    characterMalinSay.isHidden = false
                } else if state == 5 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 6", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                } else if state == 6 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 7", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                    characterMalin.run(SKAction.move(to: CGPoint(x: size.width/0.8, y: size.height/2.6), duration: 5.0))
                    characterIstriMalin.run(SKAction.move(to: CGPoint(x: size.width/0.8, y: size.height/2.7), duration: 4.0))
                }
                characterMalinSay = dataIntro[state].imageName
                labelTextStory.text = dataIntro[state].textDialogue
            }
        } else {
            state += 1
            if state == 7 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .left, duration: 1)
                let newScene = MalinKundang_Scene16(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 1 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 2", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                } else if state == 2 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 3", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                } else if state == 3 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 4", fileExtension: "m4a")
                    characterIbuMalinSay.isHidden = true
                    characterIstriMalinSay.isHidden = false
                } else if state == 4 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 5", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                } else if state == 5 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 6", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                } else if state == 6 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 7", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                    characterMalin.run(SKAction.move(to: CGPoint(x: size.width/0.8, y: size.height/2.6), duration: 5.0))
                    characterIstriMalin.run(SKAction.move(to: CGPoint(x: size.width/0.8, y: size.height/2.7), duration: 4.0))
                }
                characterMalinSay = dataIntro[state].imageName
                labelTextStory.text = dataIntro[state].textDialogue
            }
        }
    }
    
    func buttonPreviousScene () {
        if stateMusic {
            run(clickButton)
        }
        if buttonPrevious.action(forKey: "Previous Next") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            state -= 1
            if state < 0 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene14(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 0 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15  1", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                } else if state == 1 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 2", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                } else if state == 2 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 3", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                } else if state == 3 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 4", fileExtension: "m4a")
                    characterIbuMalinSay.isHidden = true
                    characterIstriMalinSay.isHidden = false
                } else if state == 4 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 5", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                } else if state == 5 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 6", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                }
                characterMalinSay = dataIntro[state].imageName
                labelTextStory.text = dataIntro[state].textDialogue
            }
        } else {
            state -= 1
            if state < 0 {
                Sound.sharedInstance.stop()
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Scene14(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 0 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15  1", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                } else if state == 1 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 2", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                } else if state == 2 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 3", fileExtension: "m4a")
                    characterMalinSay.isHidden = true
                    characterIbuMalinSay.isHidden = false
                } else if state == 3 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 4", fileExtension: "m4a")
                    characterIbuMalinSay.isHidden = true
                    characterIstriMalinSay.isHidden = false
                } else if state == 4 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 5", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                } else if state == 5 {
                    Sound.sharedInstance.stop()
                    Sound.sharedInstance.playDubbing(file: "15 6", fileExtension: "m4a")
                    characterMalinSay.isHidden = false
                    characterIstriMalinSay.isHidden = true
                }
                characterMalinSay = dataIntro[state].imageName
                labelTextStory.text = dataIntro[state].textDialogue
            }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
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
        startTreeAnimation()
    }
}
