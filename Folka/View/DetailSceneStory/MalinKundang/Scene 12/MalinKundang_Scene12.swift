//
//  MalinKundang_Scene12.swift
//  Folka
//
//  Created by Ferry Julian on 26/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene12: SKScene {
    let playableRect: CGRect

    let backgroundSky = SKSpriteNode(imageNamed: "backgroundPuzzle")
    let backgroundSea = SKSpriteNode(imageNamed: "backgroundOpenSea")
    
    var labelTextStory = SKLabelNode(fontNamed: "McLaren")
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 10.0/3.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.white
        
        backgroundSky.size = CGSize(width: 2050, height: 1120)
        backgroundSky.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSky.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSky.zPosition = 0
        addChild(backgroundSky)
        
        backgroundSea.size = CGSize(width: 2050, height: 1120)
        backgroundSea.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSea.zPosition = 1
        addChild(backgroundSea)
//
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(moveCloud), SKAction.wait(forDuration: 7.5)])))

    }
    
    func moveCloud() {
        let nonCharacterCloud1 = SKSpriteNode(imageNamed: "cloud1")
        nonCharacterCloud1.name = "cloud1"
        nonCharacterCloud1.position = CGPoint(x: size.width/0.9, y: size.height/1.7)
        nonCharacterCloud1.size = CGSize(width: 1000, height: 200)
        nonCharacterCloud1.zPosition = 1.5
        addChild(nonCharacterCloud1)
        
        let nonCharacterCloud2 = SKSpriteNode(imageNamed: "cloud2")
        nonCharacterCloud2.name = "cloud2"
        nonCharacterCloud2.position = CGPoint(x: size.width/0.7, y: size.height/1.35)
        nonCharacterCloud2.size = CGSize(width: 400, height: 100)
        nonCharacterCloud2.zPosition = 1.5
        addChild(nonCharacterCloud2)
        
        let nonCharacterCloud3 = SKSpriteNode(imageNamed: "cloud3")
        nonCharacterCloud3.name = "cloud3"
        nonCharacterCloud3.position = CGPoint(x: size.width/0.5, y: size.height/1.4)
        nonCharacterCloud3.size = CGSize(width: 400, height: 100)
        nonCharacterCloud3.zPosition = 1.5
        addChild(nonCharacterCloud3)
        
        let nonCharacterCloud4 = SKSpriteNode(imageNamed: "cloud4")
        nonCharacterCloud4.name = "cloud4"
        nonCharacterCloud4.position = CGPoint(x: size.width/0.4, y: size.height/1.6)
        nonCharacterCloud4.size = CGSize(width: 1000, height: 200)
        nonCharacterCloud4.zPosition = 1.5
        addChild(nonCharacterCloud4)
        
        let actionMoveCloud1 = SKAction.moveTo(x: -nonCharacterCloud1.size.width/2, duration: 6.0)
        let actionRemoveCloud1 = SKAction.removeFromParent()
        
        let actionMoveCloud2 = SKAction.moveTo(x: -nonCharacterCloud2.size.width/2, duration: 6.0)
        let actionRemoveCloud2 = SKAction.removeFromParent()
        
        let actionMoveCloud3 = SKAction.moveTo(x: -nonCharacterCloud3.size.width/2, duration: 7.0)
        let actionRemoveCloud3 = SKAction.removeFromParent()
        
        let actionMoveCloud4 = SKAction.moveTo(x: -nonCharacterCloud4.size.width/2, duration: 8.0)
        let actionRemoveCloud4 = SKAction.removeFromParent()
        
        nonCharacterCloud1.run(SKAction.sequence([actionMoveCloud1, actionRemoveCloud1]))
        nonCharacterCloud2.run(SKAction.sequence([actionMoveCloud2, actionRemoveCloud2]))
        nonCharacterCloud3.run(SKAction.sequence([actionMoveCloud3, actionRemoveCloud3]))
        nonCharacterCloud4.run(SKAction.sequence([actionMoveCloud4, actionRemoveCloud4]))
        
    }
}
