//
//  MalinKundang_AlternateScene17.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//


import SpriteKit
import GameplayKit

struct DialogueScene {
    var textDialogue: String!
}

class MalinKundang_AlternateScene17: SKScene {
    
    //MARK: Library sesuaikan dengan framework
    let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
    let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene16_1")
    var animationIbuMalin: SKAction?
    
    let characterMalin = SKSpriteNode(imageNamed: "malinAlternate_scene17")
    
    let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
    
    let nonCharacterHouse = SKSpriteNode(imageNamed: "house1")
    var animationHouse: SKAction?
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
    var animationTree: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "McLaren")
    
    var dataIntro: [DialogueScene] = []
    var state = 0
    
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    
    override func didMove(to view: SKView) {
        // MARK: Default background white
        let rect = CGRect(x: 0, y: 0, width: 200, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        self.backgroundColor = SKColor.white
        
        let data1 = DialogueScene(textDialogue: "“Ibu, maafkan perbuatanku.”")
        let data2 = DialogueScene(textDialogue: "“Iya tidak apa-apa nak.”")
        let data3 = DialogueScene(textDialogue: "“Ibu sudah memaafkanmu.”")
        
        dataIntro = [data1, data2, data3]
        
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
        
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 950, height: 1200)
        characterIbuMalin.position = CGPoint(x: size.width/2.8, y: size.height/2.4)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 2
        addChild(characterIbuMalin)
        
        characterMalin.name = "Malin"
        characterMalin.size = CGSize(width: 250, height: 400)
        characterMalin.position = CGPoint(x: size.width/1.9, y: size.height/2.1)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
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
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = +4
        addChild(buttonHome)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 150, height: 150)
        buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = 4
        addChild(buttonPrevious)
        
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 150, height: 150)
        buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = 4
        addChild(buttonNext)
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        labelTextStory.text = dataIntro[0].textDialogue
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1320
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/3.8)
        labelTextStory.zPosition = +4.5
        addChild(labelTextStory)
        
    }
    
    //MARK: SOURCE CODE ASSET GERAK
    override init(size: CGSize){
        var textures: [SKTexture] = []
        for index in 1...3 {
            textures.append(SKTexture(imageNamed: "malinScene1_\(index)"))
        }
        
        var textures1: [SKTexture] = []
        for index in 1...2 {
            textures1.append(SKTexture(imageNamed: "ibuMalinScene16_\(index)"))
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
        
        animationIbuMalin = SKAction.animate(with: textures1, timePerFrame: 0.3)
        animationTree = SKAction.animate(with: textures2, timePerFrame: 0.5)
        animationHouse = SKAction.animate(with: textures3, timePerFrame: 0.5)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonNextScene() {
        run(clickButton)
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run((buttonNextAction!), withKey: "Button Next")
            state += 1
            print(state)
            if state == 1 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 2 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 3 {
                let prevScene = EndingStoryViewController(nibName: "EndingStoryViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            }
        } else {
            state += 1
            print(state)
            if state == 1 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 2 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 3 {
                let prevScene = EndingStoryViewController(nibName: "EndingStoryViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            }
        }
    }
    
    func buttonPreviousScene () {
        run(clickButton)
        if buttonPrevious.action(forKey: "Previous Next") == nil {
            buttonPrevious.run((buttonPreviousAction!), withKey: "Button Previous")
            state -= 1
            print(state)
            if state == -1 {
                let prevScene = ChoiceEndingViewController(nibName: "ChoiceEndingViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            } else if state == 0 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 1 {
                labelTextStory.text = dataIntro[state].textDialogue
            }
        }
        else {
            if state == -1 {
                let prevScene = ChoiceEndingViewController(nibName: "ChoiceEndingViewController", bundle: nil)
                self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            } else if state == 0 {
                labelTextStory.text = dataIntro[state].textDialogue
            } else if state == 1 {
                labelTextStory.text = dataIntro[state].textDialogue
            }
        }
    }
    
    func buttonHomeScene() {
        run(clickButton)
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            let prevScene = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
            self.view!.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
            
        }
    }
    
    
    func startIbuMalinAnimation() {
        if characterIbuMalin.action(forKey: "Ibu Malin Scene1") == nil {
            characterIbuMalin.run(SKAction.repeatForever(animationIbuMalin!), withKey: "Ibu Malin Scene1")
        }
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
    
    func startHouseAnimation() {
        if nonCharacterHouse.action(forKey: "House") == nil {
            nonCharacterHouse.run(SKAction.repeatForever(animationHouse!), withKey: "House")
        }
    }
    
    func stopHouseAnimation() {
        nonCharacterHouse.removeAction(forKey: "House")
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
                }else{
                    if node.name == "ibuMalin" {
                        stopIbuMalinAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == nonCharacterTree.name {
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
        }else if atPoint((touch?.location(in: self))!).name == nonCharacterHouse.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.nonCharacterHouse.hasActions(){
                    if node.name == "house" {
                        startHouseAnimation()
                    }
                }else{
                    if node.name == "house" {
                        stopHouseAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonNext" {
                    buttonNextScene()
                }
            }
        }
        else if atPoint((touch?.location(in: self))!).name == buttonHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonHome" {
                    buttonHomeScene()
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonPrevious" {
                    buttonPreviousScene()
                }
            }
        }
    }
}
