//
//  MalinKundang_Scene1.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene1: SKScene {
    
    //MARK: Library sesuaikan dengan framework
    let backgroundSky = SKSpriteNode(imageNamed: "skyBackground")
    let backgroundGround = SKSpriteNode(imageNamed: "groundBackground")
    
    let characterMalin = SKSpriteNode(imageNamed: "malinScene1_1")
    var animationMalin: SKAction?
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene1_1")
    var animationIbuMalin: SKAction?
    
    let nonCharacterSea = SKSpriteNode(imageNamed: "sea")
    
    let nonCharacterSandCastle = SKSpriteNode(imageNamed: "sandCastle")
    
    let nonCharacterHouse = SKSpriteNode(imageNamed: "house1")
    var animationHouse: SKAction?
    
    let nonCharacterHouse1 = SKSpriteNode(imageNamed: "house1")
    var animationHouse1: SKAction?
    
    let nonCharacterTree = SKSpriteNode(imageNamed: "tree1")
    var animationTree: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    let buttonSound = SKSpriteNode(imageNamed: "buttonSound")

    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let nonCharacterTextLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "McLaren")
    
    override func didMove(to view: SKView) {
        // MARK: Default background white
        let rect = CGRect(x: 0, y: 0, width: 200, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        self.backgroundColor = SKColor.white
        
        backgroundSky.size = CGSize(width: 2040, height: 1120)
        backgroundSky.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSky.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSky.zPosition = 1
        addChild(backgroundSky)
        
        backgroundGround.size = CGSize(width: 2040, height: 1120)
        backgroundGround.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundGround.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundGround.zPosition = -1
        addChild(backgroundGround)
        
        nonCharacterSea.size = CGSize(width: 2040, height: 1120)
        nonCharacterSea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        nonCharacterSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSea.zPosition = 0
        nonCharacterSea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(nonCharacterSea)
        
        characterMalin.name = "malin"
        characterMalin.size = CGSize(width: 300, height: 380)
        characterMalin.position = CGPoint(x: size.width/1.7, y: size.height/2.2)
        characterMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterMalin.zPosition = 2
        addChild(characterMalin)
        
        characterIbuMalin.name = "ibuMalin"
        characterIbuMalin.size = CGSize(width: 450, height: 600)
        characterIbuMalin.position = CGPoint(x: size.width/3.0, y: size.height/1.9)
        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        characterIbuMalin.zPosition = 2
        addChild(characterIbuMalin)
        
        nonCharacterHouse.name = "house"
        nonCharacterHouse.size = CGSize(width: 400, height: 500)
        nonCharacterHouse.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
        nonCharacterHouse.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHouse.zPosition = 3
        addChild(nonCharacterHouse)
        
        nonCharacterHouse1.name = "house1"
        nonCharacterHouse1.size = CGSize(width: 400, height: 500)
        nonCharacterHouse1.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
        nonCharacterHouse1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHouse1.zPosition = 3.5
        addChild(nonCharacterHouse1)
        
        nonCharacterSandCastle.size = CGSize(width: 300, height: 350)
        nonCharacterSandCastle.position = CGPoint(x: size.width/2.0, y: size.height/2.4)
        nonCharacterSandCastle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSandCastle.zPosition = 2
        addChild(nonCharacterSandCastle)
        
        nonCharacterTree.name = "tree"
        nonCharacterTree.size = CGSize(width: 550, height: 980)
        nonCharacterTree.position = CGPoint(x: size.width/11.0, y: size.height/2.3)
        nonCharacterTree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTree.zPosition = 2
        nonCharacterTree.zRotation = CGFloat.pi / -23
        addChild(nonCharacterTree)
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 130, height: 130)
        buttonHome.position = CGPoint(x: size.width/10.5, y: size.height/1.35)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = +4
        addChild(buttonHome)
        
        buttonSound.name = "buttonSound"
        buttonSound.size = CGSize(width: 130, height: 130)
        buttonSound.position = CGPoint(x: size.width/1.1, y: size.height/1.35)
        buttonSound.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonSound.zPosition = +4
        addChild(buttonSound)
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 150, height: 150)
        buttonNext.position = CGPoint(x: size.width/1.1, y: size.height/3.2)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = +4
        addChild(buttonNext)
        
        nonCharacterTextLayout.size = CGSize(width: 1400, height: 230)
        nonCharacterTextLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        nonCharacterTextLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterTextLayout.zPosition = +4
        addChild(nonCharacterTextLayout)
        
        labelTextStory.text = "Dahulu kala hiduplah seorang ibu bernama Mande Rubayah dan anak laki-lakinya, Malin Kundang. Mande Rubayah menghidupi Malin seorang diri hingga menjadi anak yang gagah dan tampan."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 32
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1300
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
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
            textures1.append(SKTexture(imageNamed: "ibuMalinScene1_\(index)"))
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
            textures4.append(SKTexture(imageNamed: "house\(index)"))
        }
        
        animationMalin = SKAction.animate(with: textures, timePerFrame: 0.3)
        animationIbuMalin = SKAction.animate(with: textures1, timePerFrame: 0.3)
        animationTree = SKAction.animate(with: textures2, timePerFrame: 0.5)
        animationHouse = SKAction.animate(with: textures3, timePerFrame: 0.5)
        animationHouse1 = SKAction.animate(with: textures4, timePerFrame: 0.5)
        buttonNextAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonNextScene() {
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run(SKAction.repeatForever(buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene2(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func startMalinAnimation() {
        if characterMalin.action(forKey: "Malin Scene1") == nil {
            characterMalin.run(SKAction.repeatForever(animationMalin!), withKey: "Malin Scene1")
        }
    }
    
    func stopMalinAnimation() {
        characterMalin.removeAction(forKey: "Malin Scene1")
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
    
    func startHouse1Animation() {
        if nonCharacterHouse1.action(forKey: "House1") == nil {
            nonCharacterHouse1.run(SKAction.repeatForever(animationHouse1!), withKey: "House1")
        }
    }
    
    func stopHouse1Animation() {
        nonCharacterHouse1.removeAction(forKey: "House1")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == characterMalin.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.characterMalin.hasActions(){
                    if node.name == "malin" {
                        startMalinAnimation()
                    }
                    
                } else{
                    if node.name == "malin" {
                        stopMalinAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == characterIbuMalin.name {
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
        }else if atPoint((touch?.location(in: self))!).name == nonCharacterHouse1.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.nonCharacterHouse1.hasActions(){
                    if node.name == "house1" {
                        startHouse1Animation()
                    }
                }else{
                    if node.name == "house1" {
                        stopHouse1Animation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == buttonNext.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonNext.hasActions(){
                    if node.name == "buttonNext" {
                        buttonNextScene()
                    }
                }
            }
        }
    }
}
