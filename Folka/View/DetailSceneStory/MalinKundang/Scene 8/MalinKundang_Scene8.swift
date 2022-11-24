//
//  MalinKundang_Scene8.swift
//  Folka
//
//  Created by Ferry Julian on 24/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene8: SKScene {
    let backgroundMarried = SKSpriteNode(imageNamed: "backgroundMarried")
    
    let nonCharacterFlowers = SKSpriteNode(imageNamed: "marriedFlowers")
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    let buttonSound = SKSpriteNode(imageNamed: "buttonSound")
    
    let textLayout = SKSpriteNode(imageNamed: "textLayout")
    var labelTextStory = SKLabelNode(fontNamed: "McLaren")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        backgroundMarried.size = CGSize(width: 2060, height: 1120)
        backgroundMarried.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundMarried.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundMarried.zPosition = 0
        addChild(backgroundMarried)
        
        nonCharacterFlowers.size = CGSize(width: 2060, height: 400)
        nonCharacterFlowers.position = CGPoint(x: size.width/2.0, y: size.height/1.5)
        nonCharacterFlowers.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterFlowers.zPosition = 1
        addChild(nonCharacterFlowers)
        
        buttonNext.name = "buttonNext"
        buttonNext.size = CGSize(width: 170, height: 170)
        buttonNext.position = CGPoint(x: size.width/1.07, y: size.height/3.5)
        buttonNext.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNext.zPosition = 2
        addChild(buttonNext)
        
        buttonPrevious.name = "buttonPrevious"
        buttonPrevious.size = CGSize(width: 170, height: 170)
        buttonPrevious.position = CGPoint(x: size.width/17.0, y: size.height/3.5)
        buttonPrevious.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonPrevious.zPosition = 2
        addChild(buttonPrevious)
        
        buttonHome.name = "buttonHome"
        buttonHome.size = CGSize(width: 170, height: 170)
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 2
        addChild(buttonHome)
        
        buttonSound.name = "buttonSound"
        buttonSound.size = CGSize(width: 170, height: 170)
        buttonSound.position = CGPoint(x: size.width/1.07, y: size.height/1.38)
        buttonSound.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonSound.zPosition = 2
        addChild(buttonSound)
        
        textLayout.size = CGSize(width: 1300, height: 200)
        textLayout.position = CGPoint(x: size.width/2.0, y: size.height/3.6)
        textLayout.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        textLayout.zPosition = 2
        addChild(textLayout)
        
        labelTextStory.text = "Di sana ia menjadi pedagang kaya dan menikahi gadis cantik anak saudagar di desa itu."
        labelTextStory.fontColor = SKColor.white
        labelTextStory.fontSize = 42
        labelTextStory.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTextStory.numberOfLines = 0
        labelTextStory.preferredMaxLayoutWidth = 1250
        labelTextStory.position = CGPoint(x: size.width/2, y: size.height/4.25)
        labelTextStory.zPosition = 2.5
        addChild(labelTextStory)
    }
}
