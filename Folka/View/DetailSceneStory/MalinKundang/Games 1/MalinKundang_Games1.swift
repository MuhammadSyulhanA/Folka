//
//  MalinKundang_Games1.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Games1: SKScene {
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    let fishMovePointPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    let background = SKSpriteNode(imageNamed: "backgroundSea")
    
    let redFish = SKSpriteNode(imageNamed: "redFish")
    var redFishAnimation: SKAction?

    let blueFish = SKSpriteNode(imageNamed: "blueFish")
    var blueFishAnimation: SKAction?

    let zebraFish = SKSpriteNode(imageNamed: "zebraFish")
    var zebraFishAnimation: SKAction?
    
    let seaweed = SKSpriteNode(imageNamed: "seaweed")
    let seaweed1 = SKSpriteNode(imageNamed: "seaweed")
    let seaweed2 = SKSpriteNode(imageNamed: "seaweed")

    let apple = SKSpriteNode(imageNamed: "apple")
    var appleAnimation: SKAction?
    
    let bottle = SKSpriteNode(imageNamed: "bottle")
    var bottleAnimation: SKAction?

    override func didMove(to view: SKView) {
        // MARK: Default background white
        self.backgroundColor = SKColor.white
        

        background.size = CGSize(width: 2040, height: 1120)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        redFish.size = CGSize(width: 200, height: 150)
        redFish.position = CGPoint(x: size.width/10.3, y: size.height/1.6)
        redFish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redFish.zPosition = 0
        addChild(redFish)
        
        blueFish.size = CGSize(width: 150, height: 150)
        blueFish.position = CGPoint(x: size.width/2.3, y: size.height/1.4)
        blueFish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        blueFish.zPosition = 0
        addChild(blueFish)
        
        zebraFish.size = CGSize(width: 150, height: 150)
        zebraFish.position = CGPoint(x: size.width/4.3, y: size.height/1.9)
        zebraFish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        zebraFish.zPosition = 0
        addChild(zebraFish)
        
        bottle.size = CGSize(width: 110, height: 180)
        bottle.position = CGPoint(x: size.width/1.6, y: size.height/1.7)
        bottle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bottle.zPosition = 0
        addChild(bottle)
        
        apple.size = CGSize(width: 140, height: 150)
        apple.position = CGPoint(x: size.width/1.2, y: size.height/1.5)
        apple.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        apple.zPosition = 0
        addChild(apple)
        
        seaweed.size = CGSize(width: 300, height: 300)
        seaweed.position = CGPoint(x: size.width/4.2, y: size.height/2.95)
        seaweed.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        seaweed.zPosition = 1
        addChild(seaweed)
        
        seaweed1.size = CGSize(width: 300, height: 300)
        seaweed1.position = CGPoint(x: size.width/1.75, y: size.height/3.1)
        seaweed1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        seaweed1.zPosition = 1
        addChild(seaweed1)
        
        seaweed2.size = CGSize(width: 300, height: 300)
        seaweed2.position = CGPoint(x: size.width/1.08, y: size.height/2.97)
        seaweed2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        seaweed2.zPosition = 1
        addChild(seaweed2)
    }
    
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint) {
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
//        print("Amount to move: \(amountToMove)")
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
  
  func swimmingFish(){
    let randomFishYPositionGenerator = GKRandomDistribution(lowestValue: 50, highestValue: Int(self.frame.size.width))
    
//    blueFish.size = CGSize(width: 150, height: 150)
//    blueFish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    blueFish.zPosition = 0
//    blueFish.position = CGPoint(x: size.width/2.3, y: size.height/1.4)
    
    let yPosition = CGFloat(randomFishYPositionGenerator.nextInt())
    let rightToLeft = arc4random() % 2 == 0
//    let xPosition = rightToLeft ? self.frame.size.width/2.3
    let xPosition = rightToLeft ? self.frame.size.width + blueFish.size.width / 2 : -blueFish.size.width / 2
   

    print("\(randomFishYPositionGenerator)")
    print("\(xPosition)")
    blueFish.position = CGPoint(x: xPosition, y: yPosition)

    if rightToLeft{
      blueFish.xScale = -1
    }

//    self.addChild(blueFish)

//    blueFish.run(SKAction.repeatForever(SKAction.animate(with: , timePerFrame: 0.05, resize: false, restore: true)))

    var distanceToCover = self.frame.size.width + blueFish.size.width
    if rightToLeft{
      distanceToCover *= -1
    }

    let time = TimeInterval(abs(distanceToCover/70))

    let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)

    let removeAction = SKAction.run{
      self.blueFish.removeAllActions()
      self.blueFish.removeFromParent()
    }
    let allActions = SKAction.sequence([moveAction, removeAction])
    blueFish.run(allActions)
  }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        print("\(dt*1000) milliseconds since last update")
        moveSprite(sprite: redFish, velocity: CGPoint(x: fishMovePointPerSec, y: 0))
        swimmingFish()
    }
}
