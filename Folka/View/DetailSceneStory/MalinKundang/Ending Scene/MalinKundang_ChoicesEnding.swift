//
//  ChoicesEnding.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 05/12/22.
//
import SpriteKit
import GameplayKit

class MalingKundang_ChoicesEnding: SKScene {
    //MARK: BACKGROUND
    let background = SKSpriteNode(imageNamed: "backgroundChooseEnding")
    
    //MARK: BUTTON
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    let buttonMintaMaaf = SKSpriteNode(imageNamed: "buttonApologize")
    var buttonMintaMaafAction: SKAction?
    let buttonMenyambut = SKSpriteNode(imageNamed: "buttonWelcome")
    var buttonMenyambutAction: SKAction?
    
    //MARK: SOUND/MUSIC
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    
    override init(size: CGSize) {
        //MARK: SK ACTION BUTTON
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonMintaMaafAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        //MARK: INIZIALITATION BACKGROUND
        self.backgroundColor = SKColor.white
        
        background.size = CGSize(width: 2050, height: 1000)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        //MARK: INIZIALITATION BUTTON
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.name = "buttonHome"
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 1.5
        addChild(buttonHome)
        
        buttonMintaMaaf.name = "buttonMintaMaaf"
        buttonMintaMaaf.size = CGSize(width: 650, height: 120)
        buttonMintaMaaf.position = CGPoint(x: size.width/3.00, y: size.height/3.5)
        buttonMintaMaaf.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonMintaMaaf.zPosition = 1
        addChild(buttonMintaMaaf)
        
        buttonMenyambut.name = "buttonMenyambut"
        buttonMenyambut.size = CGSize(width: 650, height: 120)
        buttonMenyambut.position = CGPoint(x: size.width/1.5, y: size.height/3.5)
        buttonMenyambut.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonMenyambut.zPosition = 1
        addChild(buttonMenyambut)
    }
    
    //MARK: FUNCTION BUTTON HOME
    func buttonHomeScene() {
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    //MARK: FUNCTION BUTTON MAAF
    func buttonMintaMaafScene() {
        let reveal = SKTransition.reveal(with: .right, duration: 1)
        let newScene = MalinKundang_AlternateScene17(size: CGSize(width: 2048, height: 1536))
        newScene.scaleMode = .aspectFill
        scene?.view!.presentScene(newScene, transition: reveal)
    }
    
    //MARK: FUNCTION BUTTON MENYAMBUT
    func buttonMenyambutScene() {
        let reveal = SKTransition.reveal(with: .right, duration: 1)
        let newScene = MalinKundang_AlternateScene15(size: CGSize(width: 2048, height: 1536))
        newScene.scaleMode = .aspectFill
        scene?.view!.presentScene(newScene, transition: reveal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == buttonHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonHome.hasActions(){
                    if node.name == "buttonHome" {
                        buttonHomeScene()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == buttonMintaMaaf.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonMintaMaaf.hasActions(){
                    if node.name == "buttonMintaMaaf" {
                        buttonMintaMaafScene()
                    }
                }
            }
        } else if atPoint((touch?.location(in: self))!).name == buttonMenyambut.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonMenyambut.hasActions(){
                    if node.name == "buttonMenyambut" {
                        buttonMenyambutScene()
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}


