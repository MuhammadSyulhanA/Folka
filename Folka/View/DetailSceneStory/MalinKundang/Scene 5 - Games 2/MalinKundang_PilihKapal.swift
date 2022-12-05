//
//  MalinKundang_ScenePilihKapal.swift
//  Folka
//
//  Created by Ferry Julian on 05/12/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_PilihKapal: SKScene {
    
    let backgroundPuzzle = SKSpriteNode(imageNamed: "backgroundPuzzle")
    
    let nonCharacterJudul = SKSpriteNode(imageNamed: "judulPilihPuzzle")
    
    let nonCharacterKayuMilih1 = SKSpriteNode(imageNamed: "backgroundKayuMilih")
    var animateKayuMilih1: SKAction?
    
    let nonCharacterKayuMilih2 = SKSpriteNode(imageNamed: "backgroundKayuMilih")
    var animateKayuMilih2: SKAction?

    let nonCharacterKayu1 = SKSpriteNode(imageNamed: "backgroundKayu")
    var animateKayu1: SKAction?
    
    let nonCharacterKayu2 = SKSpriteNode(imageNamed: "backgroundKayu")
    var animateKayu2: SKAction?

    let nonCharacterKapalSatu = SKSpriteNode(imageNamed: "objectKapalSatu")
    var animationKapalSatu: SKAction?

    let nonCharacterKapalDua = SKSpriteNode(imageNamed: "objectKapalDua")
    var animationKapalDua: SKAction?
    
    let buttonMulai = SKSpriteNode(imageNamed: "buttonMulai")
    var buttonMulaiAction: SKAction?
    
    var state = 0
 
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        backgroundPuzzle.size = CGSize(width: 2050, height: 1120)
        backgroundPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundPuzzle.zPosition = 0
        addChild(backgroundPuzzle)
        
        nonCharacterJudul.size = CGSize(width: 800, height: 100)
        nonCharacterJudul.position = CGPoint(x: size.width/2.0, y: size.height/1.35)
        nonCharacterJudul.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterJudul.zPosition = 1
        addChild(nonCharacterJudul)
       
        nonCharacterKayu1.size = CGSize(width: 700, height: 450)
        nonCharacterKayu1.name = "kayu1"
        nonCharacterKayu1.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
        nonCharacterKayu1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKayu1.zPosition = 1
        addChild(nonCharacterKayu1)
        
        nonCharacterKayu2.size = CGSize(width: 700, height: 450)
        nonCharacterKayu2.name = "kayu2"
        nonCharacterKayu2.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
        nonCharacterKayu2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKayu2.zPosition = 1
        addChild(nonCharacterKayu2)
        
        nonCharacterKayuMilih1.size = CGSize(width: 710, height: 460)
        nonCharacterKayuMilih1.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
        nonCharacterKayuMilih1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKayuMilih1.zPosition = 1.5
        nonCharacterKayuMilih1.isHidden = true
        addChild(nonCharacterKayuMilih1)
        
        nonCharacterKayuMilih2.size = CGSize(width: 710, height: 460)
        nonCharacterKayuMilih2.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
        nonCharacterKayuMilih2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKayuMilih2.zPosition = 1.5
        nonCharacterKayuMilih2.isHidden = true
        addChild(nonCharacterKayuMilih2)
        
        nonCharacterKapalSatu.size = CGSize(width: 450, height: 300)
        nonCharacterKapalSatu.name = "kapalSatu"
        nonCharacterKapalSatu.position = CGPoint(x: size.width/3.8, y: size.height/2.0)
        nonCharacterKapalSatu.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKapalSatu.zPosition = 2
        addChild(nonCharacterKapalSatu)
        
        nonCharacterKapalDua.size = CGSize(width: 450, height: 300)
        nonCharacterKapalDua.name = "kapalDua"
        nonCharacterKapalDua.position = CGPoint(x: size.width/1.35, y: size.height/2.0)
        nonCharacterKapalDua.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterKapalDua.zPosition = 2
        addChild(nonCharacterKapalDua)
        
        buttonMulai.name = "buttonMulai"
        buttonMulai.size = CGSize(width: 450, height: 120)
        buttonMulai.position = CGPoint(x: size.width/2.0, y: size.height/3.63)
        buttonMulai.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonMulai.zPosition = 2
        addChild(buttonMulai)
    }
    
    override init(size: CGSize){
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonMulaiAction = SKAction.sequence([buttonToSmall, buttonToBig])
        animateKayu1 = SKAction.sequence([buttonToSmall, buttonToBig])
        animateKayu2 = SKAction.sequence([buttonToSmall, buttonToBig])
        animateKayuMilih1 = SKAction.sequence([buttonToSmall, buttonToBig])
        animateKayuMilih2 = SKAction.sequence([buttonToSmall, buttonToBig])
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pickKapal1() {
        state = 1
        nonCharacterKayuMilih2.isHidden = true
        nonCharacterKayuMilih1.isHidden = false
        UserDefaults.standard.set("objectKapalSatu", forKey: "kapalPilih")
        print(state)
    }
    
    func pickKapal2() {
        state = 2
        nonCharacterKayuMilih1.isHidden = true
        nonCharacterKayuMilih2.isHidden = false
        UserDefaults.standard.set("objectKapalDua", forKey: "kapalPilih")
        print(state)
    }
    
    func aksiMulai(){
        if state == 1 {
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_PuzzleBesar(size: CGSize(width: 2050, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }  else if state == 2 {
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Puzzle(size: CGSize(width: 2050, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        if atPoint((touch?.location(in: self))!).name == nonCharacterKapalSatu.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "kapalSatu" {
                    pickKapal1()
                }
            }
        }
        
        if atPoint((touch?.location(in: self))!).name == nonCharacterKapalDua.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "kapalDua" {
                    pickKapal2()
                }
            }
        }
        
        if atPoint((touch?.location(in: self))!).name == buttonMulai.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonMulai" {
                    aksiMulai()
                }
            }
        }
    }
}
