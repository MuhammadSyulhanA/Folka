//
//  MalinKundang_Scene4.swift
//  Folka
//
//  Created by Ferry Julian on 22/11/22.
//

import SpriteKit
import GameplayKit

struct Dialogue {
    var imageName: SKSpriteNode!
    var textDialogue: String!
}

class MalinKundang_Scene4: SKScene {
    
    let skyBackground = SKSpriteNode(imageNamed: "skyBackgroundZoom")
    let groundBackground = SKSpriteNode(imageNamed: "groundBackgroundZoom")
    
    let nonCharacterSea = SKSpriteNode(imageNamed: "backgroundSeaZoom")
    
    let characterMalinSad = SKSpriteNode(imageNamed: "malinScene4_1")
    var characterMalinSadAnimation: SKAction?
    
    var characterMalinSay = SKSpriteNode(imageNamed: "malinScene4_2")
    var characterMalinSayAnimation: SKAction?
        
    let characterIbuMalinSad = SKSpriteNode(imageNamed: "ibuMalinScene4_1")
    var characterIbuMalinSadAnimation: SKAction?
    
    var characterIbuMalinSay = SKSpriteNode(imageNamed: "ibuMalinScene4_2")
    var characterIbuMalinSayAnimation: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let textLayout = SKSpriteNode(imageNamed: "textLayout")
    var textStory = SKLabelNode(fontNamed: "Nunito")
  
    var dataIntro: [Dialogue] = []
    var state = 0
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var stateSound = UserDefaults.standard.bool(forKey: "fxSound")
    var stateMusic = UserDefaults.standard.bool(forKey: "fxMusic")
    
    override func didMove(to view: SKView) {
        
        let rect = CGRect(x: 0, y: 0, width: 180, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        
        let data1 = Dialogue(imageName: characterMalinSad, textDialogue: "Setelah dewasa, Malin memutuskan untuk pergi berlayar untuk mencari uang.")
        let data2 = Dialogue(imageName: characterMalinSay, textDialogue: "“Ibu, aku pamit ya. Doakan aku agar bisa mendapat banyak uang.”")
        let data3 = Dialogue(imageName: characterIbuMalinSay, textDialogue: "“Hati-hati ya nak! Jaga diri mu baik-baik di negeri orang nanti..”")
        
        dataIntro = [data1, data2, data3]
        
        self.backgroundColor = SKColor.white
        
        skyBackground.size = CGSize(width: 2050, height: 1120)
        skyBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        skyBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        skyBackground.zPosition = 1
        addChild(skyBackground)
        
        groundBackground.size = CGSize(width: 2050, height: 1120)
        groundBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        groundBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        groundBackground.zPosition = -1
        addChild(groundBackground)
        
        nonCharacterSea.size = CGSize(width: 2050, height: 1120)
        nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 0
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        characterMalinSad.name = "malinSad"
        characterMalinSad.size = CGSize(width: 1000, height: 1450)
        characterMalinSad.position = CGPoint(x: size.width/1.7, y: size.height/2.6)
        characterMalinSad.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinSad.zPosition = 2
        addChild(characterMalinSad)
        
        characterMalinSay.name = "malinSay"
        characterMalinSay.size = CGSize(width: 1000, height: 1450)
        characterMalinSay.position = CGPoint(x: size.width/1.7, y: size.height/2.6)
        characterMalinSay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalinSay.zPosition = 2.5
        characterMalinSay.isHidden = true
        addChild(characterMalinSay)
        
        characterIbuMalinSad.name = "ibuMalinSad"
        characterIbuMalinSad.size = CGSize(width: 1000, height: 1400)
        characterIbuMalinSad.position = CGPoint(x: size.width/3.0, y: size.height/3.1)
        characterIbuMalinSad.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalinSad.zPosition = 2
        addChild(characterIbuMalinSad)
        
        characterIbuMalinSay.name = "ibuMalinSay"
        characterIbuMalinSay.size = CGSize(width: 1000, height: 1400)
        characterIbuMalinSay.position = CGPoint(x: size.width/3.0, y: size.height/3.1)
        characterIbuMalinSay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalinSay.zPosition = 2.5
        characterIbuMalinSay.isHidden = true
        addChild(characterIbuMalinSay)
        
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
        
        textLayout.size = CGSize(width: 1300, height: 200)
        textLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        textLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        textLayout.zPosition = 3
        addChild(textLayout)
        
        textStory.text = dataIntro[0].textDialogue
        textStory.fontColor = SKColor.white
        textStory.fontSize = 42
        textStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        textStory.numberOfLines = 0
        textStory.preferredMaxLayoutWidth = 1235
        textStory.position = CGPoint(x: size.width/2, y: size.height/4.2)
        textStory.zPosition = 3.5
        addChild(textStory)
        
        
    }
    
    override init(size: CGSize){
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
    
    func buttonNextScene() {
        if stateMusic {
            run(clickButton)
        }
        
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            print(state)
            if state == 1 {
                characterMalinSay = dataIntro[state].imageName
                characterMalinSay.isHidden = false
                textStory.text = dataIntro[state].textDialogue
            } else if state == 2 {
                characterIbuMalinSay = dataIntro[state].imageName
                characterIbuMalinSay.isHidden = false
                characterMalinSay.isHidden = true
                textStory.text = dataIntro[state].textDialogue
            } else if state == 3 {
                print("tes")
                let prevScene = ScenePilihGame_ViewController(nibName: "ScenePilihGame_ViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            }
        } else {
            state += 1
            print(state)
            if state == 3 {
                print("tess")
                let prevScene = ScenePilihGame_ViewController(nibName: "ScenePilihGame_ViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
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
            print(state)
            if state < 0 {
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Tutorial_Games1(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                if state == 1 {
                    characterMalinSay.isHidden = false
                    characterIbuMalinSay.isHidden = true
                } else if state == 0 {
                    characterMalinSay.isHidden = true
                }
                characterMalinSay = dataIntro[state].imageName
                textStory.text = dataIntro[state].textDialogue
            }
        } else {
            state -= 1
            print(state)
            if state < 0 {
                let reveal = SKTransition.reveal(with: .right, duration: 1)
                let newScene = MalinKundang_Tutorial_Games1(size: CGSize(width: 2048, height: 1536))
                newScene.scaleMode = .aspectFill
                scene?.view!.presentScene(newScene, transition: reveal)
            }
            else {
                characterMalinSay = dataIntro[state].imageName
                characterMalinSay.isHidden = false
                textStory.text = dataIntro[state].textDialogue
            }
        }
    }
    
    func buttonHomeScene() {
        if stateMusic {
            run(clickButton)
        }
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
//            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
//            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
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
}
