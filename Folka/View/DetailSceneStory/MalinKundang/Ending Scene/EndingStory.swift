//
//  EndingStory.swift
//  Folka
//
//  Created by Ferry Julian on 05/12/22.
//

import SpriteKit
import GameplayKit

class EndingStory: SKScene {
    
    let backgroundEnding = SKSpriteNode(imageNamed: "backgroundEndingStory")
    
    let buttonBeranda = SKSpriteNode(imageNamed: "buttonBackToBeranda")
    var buttonBerandaAction: SKAction?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
        backgroundEnding.size = CGSize(width: 2050, height: 1050)
        backgroundEnding.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundEnding.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundEnding.zPosition = 0
        addChild(backgroundEnding)
        
        buttonBeranda.name = "buttonBeranda"
        buttonBeranda.size = CGSize(width: 800, height: 150)
        buttonBeranda.position = CGPoint(x: size.width/2.0, y: size.height/3.5)
        buttonBeranda.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonBeranda.zPosition = 1
        addChild(buttonBeranda)
    }
}
