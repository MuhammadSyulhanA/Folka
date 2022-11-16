//
//  MalinKundang_Games1.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Games1: SKScene {
    let playableRect: CGRect

    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    let fishMovePointPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    let background = SKSpriteNode(imageNamed: "backgroundSea")
    
    let redFish = SKSpriteNode(imageNamed: "redFish")
    var redFishAnimation: SKAction?
    
    //    let blueFish = SKSpriteNode(imageNamed: "blueFish")
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
    
    let nonCharacterHook = SKSpriteNode(imageNamed: "fishingHook")
    var hookAnimation: SKAction?
    let moveHookPointPerSec: CGFloat = 480.0
    var lastTouchLocation: CGPoint?
    
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
    
//    private lazy var gamePad: GamePad = {
//      return GamePad(
//        actionButtonBegan:  playerNode.actionButtonBegan,
//        actionButtonEnded: playerNode.actionButtonEnded
//      )
//    }()
    
    override func didMove(to view: SKView) {
        // MARK: Default background white
        self.backgroundColor = SKColor.white
        
        background.size = CGSize(width: 2040, height: 1120)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
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
        
        nonCharacterHook.size = CGSize(width: 50, height: 800)
        nonCharacterHook.name = "hook"
        nonCharacterHook.position = CGPoint(x: size.width/2.0, y: size.height/1.5)
        nonCharacterHook.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHook.zPosition = 1
        addChild(nonCharacterHook)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(swimmingFish), SKAction.wait(forDuration: 4.0)])))
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(swimmingTrash), SKAction.wait(forDuration: 10.0)])))
    }
    
    func moveHook(location: CGPoint) {
        let offset = CGPoint(x: location.x - nonCharacterHook.position.x, y: location.y - nonCharacterHook.position.y)
        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat(length), y: offset.y / CGFloat(length))
        
        velocity = CGPoint(x: direction.x * moveHookPointPerSec, y: direction.y * moveHookPointPerSec)
    }
    
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint) {
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
        print("Amount to move: \(amountToMove)")
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
    
    func swimmingFish() {
        let blueFish = SKSpriteNode(imageNamed: "blueFish")
        blueFish.position = CGPoint(x: size.width + blueFish.size.width/2, y: CGFloat.random(min: playableRect.minY + blueFish.size.height/2, max: playableRect.maxY - blueFish.size.height/2))
        blueFish.size = CGSize(width: 150, height: 150)
        addChild(blueFish)
        
        let zebraFish = SKSpriteNode(imageNamed: "zebraFish")
        zebraFish.position = CGPoint(x: size.width + zebraFish.size.width/2, y: CGFloat.random(min: playableRect.minY + zebraFish.size.height/2, max: playableRect.maxY - zebraFish.size.height/2))
        zebraFish.size = CGSize(width: 150, height: 150)
        addChild(zebraFish)
        
        let redFish = SKSpriteNode(imageNamed: "redFish")
        redFish.position = CGPoint(x: -100 + redFish.size.width/2, y: CGFloat.random(min: playableRect.minY + redFish.size.height/2, max: playableRect.maxY - redFish.size.height/2))
        redFish.size = CGSize(width: 180, height: 150)
        addChild(redFish)
        
        let actionMove = SKAction.moveTo(x: -blueFish.size.width/2, duration: 4.0)
        let actionRemove = SKAction.removeFromParent()
        
        let actionMoveZebraFish = SKAction.moveTo(x: -zebraFish.size.width/2, duration: 4.0)
        let actionRemoveZebraFish = SKAction.removeFromParent()
        
        let actionMoveRedFish = SKAction.moveTo(x: 2200, duration: 4.0)
        let actionRemoveRedFish = SKAction.removeFromParent()
        
        blueFish.run(SKAction.sequence([actionMove, actionRemove]))
        zebraFish.run(SKAction.sequence([actionMoveZebraFish, actionRemoveZebraFish]))
        redFish.run(SKAction.sequence([actionMoveRedFish, actionRemoveRedFish]))

    }
    
    func swimmingTrash() {
        let bottleTrash = SKSpriteNode(imageNamed: "bottle")
        bottleTrash.name = "bottle"
        bottleTrash.position = CGPoint(x: size.width + bottleTrash.size.width/2, y: CGFloat.random(min: CGRectGetMinY(playableRect) + bottleTrash.size.height/2, max: CGRectGetMaxY(playableRect) - bottleTrash.size.height/2))
        bottleTrash.size = CGSize(width: 110, height: 180)
        addChild(bottleTrash)
        
        let appleTrash = SKSpriteNode(imageNamed: "apple")
        appleTrash.position = CGPoint(x: -100 + appleTrash.size.width/2, y: CGFloat.random(min: CGRectGetMinY(playableRect) + appleTrash.size.height/2, max: CGRectGetMaxY(playableRect) - appleTrash.size.height/2))
        appleTrash.size = CGSize(width: 140, height: 150)
        addChild(appleTrash)
        
        let actionMoveBottleTrash = SKAction.moveTo(x: -bottleTrash.size.width/2, duration: 10.0)
        let actionRemoveBottleTrash = SKAction.removeFromParent()
        
        
        let actionMoveAppleTrash = SKAction.moveTo(x: 2200, duration: 10.0)
        let actionRemoveAppleTrash = SKAction.removeFromParent()
        
        bottleTrash.run(SKAction.sequence([actionMoveBottleTrash, actionRemoveBottleTrash]))
        appleTrash.run(SKAction.sequence([actionMoveAppleTrash, actionRemoveAppleTrash]))

    }
    
    func checkCollisions() {
        var hitBlueFish: [SKSpriteNode] = []
        enumerateChildNodes(withName: "blueFish") { node, _ in
            let blueFish = node  as! SKSpriteNode
            if CGRectIntersectsRect(blueFish.frame, self.nonCharacterHook.frame) {
                hitBlueFish.append(blueFish)
            }
        }
        for blueFish in hitBlueFish {
            print("hit fish")
            hookHitFish(blueFish: blueFish)
        }
        
        var hitBottleTrash: [SKSpriteNode] = []
        enumerateChildNodes(withName: "bottle") { node, _ in
            let bottle = node  as! SKSpriteNode
            if CGRectIntersectsRect(bottle.frame, self.nonCharacterHook.frame) {
                hitBottleTrash.append(bottle)
            }
        }
        for bottle in hitBottleTrash {
            print("hit bottle")
            hookHitBottle(bottle: bottle)
        }
    }
    
    func hookHitFish(blueFish: SKSpriteNode) {
        blueFish.removeFromParent()
    }
    
    func hookHitBottle(bottle: SKSpriteNode) {
        bottle.removeFromParent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        lastTouchLocation = touchLocation
        moveHook(location: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        lastTouchLocation = touchLocation
        moveHook(location: touchLocation)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
//        print("\(dt*1000) milliseconds since last update")
//
        if let lastTouchLocation = lastTouchLocation {
            let diff = lastTouchLocation - nonCharacterHook.position
            if (diff.length() <= moveHookPointPerSec * CGFloat(dt)) {
                nonCharacterHook.position = lastTouchLocation
                velocity = CGPointZero
            } else {
                moveSprite(sprite: nonCharacterHook, velocity: velocity)
            }
        }
    }
    
    override func didEvaluateActions() {
        checkCollisions()
    }
}

