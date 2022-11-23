//
//  MalinKundang_Scene7.swift
//  Folka
//
//  Created by Ferry Julian on 23/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene7: SKScene {
    
    let fieldBackground = SKSpriteNode(imageNamed: "backgroundField")
    
    let buttonNext = SKSpriteNode(imageNamed: "buttonNext")
    var buttonNextAction: SKAction?
    
    let buttonPrevious = SKSpriteNode(imageNamed: "buttonPrevious")
    var buttonPreviousAction: SKAction?
    
    let textLayout = SKSpriteNode(imageNamed: "textLayout")
    var textStory = SKLabelNode(fontNamed: "McLaren")

}
