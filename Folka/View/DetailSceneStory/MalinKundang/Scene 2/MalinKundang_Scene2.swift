//
//  MalinKundang_Scene2.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene2: SKScene {
    
    let skyBackground = SKSpriteNode(imageNamed: "skyBackground")
    let groundBackground = SKSpriteNode(imageNamed: "groundBackground")
    
    let sea = SKSpriteNode(imageNamed: "sea")
    
    let malin = SKSpriteNode(imageNamed: "malinScene2_1")
    var malinAnimation: SKAction?
    
    let house = SKSpriteNode(imageNamed: "house1")
    var houseAnimation: SKAction?
    
    let house1 = SKSpriteNode(imageNamed: "house1")
    var house1Animation: SKAction?
    
    let tree = SKSpriteNode(imageNamed: "tree1")
    var treeAnimation: SKAction?
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    override func didMove(to view: SKView) {
        // MARK: Default background white
        let rect = CGRect(x: 0, y: 0, width: 100, height: 0)
        let path = CGPath(rect: rect, transform: nil)
        self.backgroundColor = SKColor.white
        
        skyBackground.size = CGSize(width: 2040, height: 1120)
        skyBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        skyBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        skyBackground.zPosition = 1
        addChild(skyBackground)
        
        groundBackground.size = CGSize(width: 2040, height: 1120)
        groundBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        groundBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        groundBackground.zPosition = -1
        addChild(groundBackground)
        
        sea.size = CGSize(width: 2040, height: 1120)
        sea.position = CGPoint(x: size.width/1.9, y: size.height/2)
        sea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sea.zPosition = 0
        sea.run(SKAction.repeatForever(SKAction.follow(path, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(sea)
        
        malin.name = "malin"
        malin.size = CGSize(width: 500, height: 600)
        malin.position = CGPoint(x: size.width/1.3, y: size.height/2.2)
        malin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        malin.zPosition = 2
        addChild(malin)
        
        house.name = "house"
        house.size = CGSize(width: 400, height: 500)
        house.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
        house.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        house.zPosition = 3
        addChild(house)
        
        house1.name = "house1"
        house1.size = CGSize(width: 400, height: 500)
        house1.position = CGPoint(x: size.width/4.8, y: size.height/1.6)
        house1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        house1.zPosition = 3.5
        addChild(house1)
        
        tree.name = "tree"
        tree.size = CGSize(width: 550, height: 980)
        tree.position = CGPoint(x: size.width/11.0, y: size.height/2.3)
        tree.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        tree.zPosition = 2
        tree.zRotation = CGFloat.pi / -23
        addChild(tree)
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 150, height: 150)
        buttonNext.position = CGPoint(x: size.width/1.1, y: size.height/3.2)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = +4
        addChild(buttonNext)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 150, height: 150)
        buttonPrevious.position = CGPoint(x: size.width/10.5, y: size.height/3.2)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = +4
        addChild(buttonPrevious)
        
    }
    
    override init(size: CGSize){
        var textures: [SKTexture] = []
        for index in 1...3 {
            textures.append(SKTexture(imageNamed: "malinScene2_\(index)"))
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
        
        malinAnimation = SKAction.animate(with: textures, timePerFrame: 0.3)
        treeAnimation = SKAction.animate(with: textures2, timePerFrame: 0.5)
        houseAnimation = SKAction.animate(with: textures3, timePerFrame: 0.5)
        house1Animation = SKAction.animate(with: textures4, timePerFrame: 0.5)
        buttonNextAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)
        buttonPreviousAction = SKAction.resize(toWidth: 180, height: 180, duration: 2.0)

        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonNextScene() {
        if buttonNext.action(forKey: "Button Next") == nil {
            buttonNext.run(SKAction.repeatForever(buttonNextAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Games1(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonPreviousScene() {
        if buttonPrevious.action(forKey: "Button Previous") == nil {
            buttonPrevious.run(SKAction.repeatForever(buttonPreviousAction!), withKey: "Button Previous")
            let reveal = SKTransition.reveal(with: .right, duration: 1)
            let prevScene = MalinKundang_Scene1(size: CGSize(width: 2048, height: 1536))
            prevScene.scaleMode = .aspectFill
            scene?.view!.presentScene(prevScene, transition: reveal)
        }
    }
    
    func startMalinAnimation() {
        if malin.action(forKey: "Malin Scene1") == nil {
            malin.run(SKAction.repeatForever(malinAnimation!), withKey: "Malin Scene1")
        }
    }
    
    func stopMalinAnimation() {
        malin.removeAction(forKey: "Malin Scene1")
    }
    
    func startTreeAnimation() {
        if tree.action(forKey: "Tree") == nil {
            tree.run(SKAction.repeatForever(treeAnimation!), withKey: "Tree")
        }
    }
    
    func stopTreeAnimation() {
        tree.removeAction(forKey: "Tree")
    }
    
    func startHouseAnimation() {
        if house.action(forKey: "House") == nil {
            house.run(SKAction.repeatForever(houseAnimation!), withKey: "House")
        }
    }
    
    func stopHouseAnimation() {
        house.removeAction(forKey: "House")
    }
    
    func startHouse1Animation() {
        if house1.action(forKey: "House1") == nil {
            house1.run(SKAction.repeatForever(house1Animation!), withKey: "House1")
        }
    }
    
    func stopHouse1Animation() {
        house1.removeAction(forKey: "House1")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == malin.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.malin.hasActions(){
                    if node.name == "malin" {
                        startMalinAnimation()
                    }
                    
                } else{
                    if node.name == "malin" {
                        stopMalinAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == tree.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.tree.hasActions(){
                    if node.name == "tree" {
                        startTreeAnimation()
                    }
                }else{
                    if node.name == "tree" {
                        stopTreeAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == house.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.house.hasActions(){
                    if node.name == "house" {
                        startHouseAnimation()
                    }
                }else{
                    if node.name == "house" {
                        stopHouseAnimation()
                    }
                }
            }
        }else if atPoint((touch?.location(in: self))!).name == house1.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.house1.hasActions(){
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
        }else if atPoint((touch?.location(in: self))!).name == buttonPrevious.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonPrevious.hasActions(){
                    if node.name == "buttonPrevious" {
                        buttonPreviousScene()
                    }
                }
            }
        }
    }
}
