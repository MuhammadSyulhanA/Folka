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
    var isBlueCatched = false
    var isRedCatched = false
    var isBottleCatched = false
    var totalFishCatched = 0
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    let fishMovePointPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    let moveHookPointPerSec: CGFloat = 480.0
    var lastTouchLocation: CGPoint?
    
    //MARK: Background
    let backgroundSea = SKSpriteNode(imageNamed: "backgroundSea")
    let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
    
    //MARK: PopUp
    let popUpCongrats = SKSpriteNode(imageNamed: "congratsPopUp")
    let popUpFailed = SKSpriteNode(imageNamed: "failedPopUp")
    let popUpExit = SKSpriteNode(imageNamed: "exitPopUp")
    
    //MARK: Button
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    var buttonHomeAction: SKAction?
    let buttonNextStory = SKSpriteNode(imageNamed: "buttonNextStoryPuzzle")
    var buttonNextStoryAction: SKAction?
    let buttonReplayGame = SKSpriteNode(imageNamed: "buttonPlayAgainPuzzle")
    var buttonReplayAction: SKAction?
    let buttonTryAgain = SKSpriteNode(imageNamed: "buttonTryAgain")
    var buttonTryAgainAction: SKAction?
    let buttonYes = SKSpriteNode(imageNamed: "buttonYes")
    var buttonYesAction: SKAction?
    let buttonNo = SKSpriteNode(imageNamed: "buttonNo")
    var buttonNoAction: SKAction?
    
    //MARK: Non Character
    let nonCharacterSeaweed = SKSpriteNode(imageNamed: "seaweed")
    let nonCharacterSeaweed1 = SKSpriteNode(imageNamed: "seaweed")
    let nonCharacterSeaweed2 = SKSpriteNode(imageNamed: "seaweed")
    
    let nonCharacterBoardTimer = SKSpriteNode(imageNamed: "boardTimer")
    let nonCharacterBoardFish = SKSpriteNode(imageNamed: "boardFish")
    
    let nonCharacterRope = SKSpriteNode(imageNamed: "longRope")
    let nonCharacterHook = SKSpriteNode(imageNamed: "fishingHook")
    var hookAnimation: SKAction?
    
    //MARK: Label
    var labelFish = SKLabelNode(fontNamed: "Nunito")
    var labelTimer = SKLabelNode(fontNamed: "Nunito")

    //MARK: Timer
    var maxTime = 25
    var timeRemaining = 25
    var gameTimer: Timer!
    
    //MARK: Sound
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var soundSucces: SKAction = SKAction.playSoundFileNamed("soundSucces", waitForCompletion: true)
    var soundFailed: SKAction = SKAction.playSoundFileNamed("soundFailed", waitForCompletion: true)
    
    override func didMove(to view: SKView) {
        // MARK: Background
        self.backgroundColor = SKColor.white
        backgroundSea.size = CGSize(width: 2050, height: 1120)
        backgroundSea.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSea.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundSea.zPosition = -1
        addChild(backgroundSea)
        
        //MARK: Background opacity selalu muncul setiap muncul pop up
        backgroundOpacity.size = CGSize(width: 2050, height: 1120)
        backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundOpacity.zPosition = 2
        backgroundOpacity.isHidden = true
        addChild(backgroundOpacity)
        
        // MARK: Non Character
        nonCharacterSeaweed.size = CGSize(width: 300, height: 300)
        nonCharacterSeaweed.position = CGPoint(x: size.width/4.2, y: size.height/2.95)
        nonCharacterSeaweed.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSeaweed.zPosition = 1
        addChild(nonCharacterSeaweed)
        
        nonCharacterSeaweed1.size = CGSize(width: 300, height: 300)
        nonCharacterSeaweed1.position = CGPoint(x: size.width/1.75, y: size.height/3.1)
        nonCharacterSeaweed1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSeaweed1.zPosition = 1
        addChild(nonCharacterSeaweed1)
        
        nonCharacterSeaweed2.size = CGSize(width: 300, height: 300)
        nonCharacterSeaweed2.position = CGPoint(x: size.width/1.08, y: size.height/2.97)
        nonCharacterSeaweed2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterSeaweed2.zPosition = 1
        addChild(nonCharacterSeaweed2)
        
        nonCharacterBoardTimer.size = CGSize(width: 280, height: 100)
        nonCharacterBoardTimer.position = CGPoint(x: size.width/2.0, y: size.height/1.38)
        nonCharacterBoardTimer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBoardTimer.zPosition = 1
        addChild(nonCharacterBoardTimer)
        
        nonCharacterBoardFish.size = CGSize(width: 192, height: 100)
        nonCharacterBoardFish.position = CGPoint(x: size.width/1.08, y: size.height/1.38)
        nonCharacterBoardFish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterBoardFish.zPosition = 1
        addChild(nonCharacterBoardFish)
        
        nonCharacterHook.size = CGSize(width: 40, height: 40)
        nonCharacterHook.name = "hook"
        nonCharacterHook.position = CGPoint(x: size.width/2.0, y: size.height/1.5)
        nonCharacterHook.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterHook.zPosition = 2
        addChild(nonCharacterHook)
        
        nonCharacterRope.size = CGSize(width: 10, height: 958)
        nonCharacterRope.name = "rope"
        nonCharacterRope.position = CGPoint(x: size.width/2.0 - 10.0, y: nonCharacterHook.position.y + ((size.height/1.03) - nonCharacterHook.position.y))
        nonCharacterRope.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterRope.zPosition = 1
        addChild(nonCharacterRope)
        
        // MARK: Label
        labelFish.text = "x \(totalFishCatched)"
        labelFish.fontColor = SKColor.white
        labelFish.fontSize = 50
        labelFish.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelFish.numberOfLines = 0
        labelFish.preferredMaxLayoutWidth = 1300
        labelFish.position = CGPoint(x: size.width/1.06, y: size.height/1.41)
        labelFish.zPosition = 1.5
        addChild(labelFish)
        
        labelTimer.text = "START!"
        labelTimer.fontColor = SKColor.white
        labelTimer.fontSize = 50
        labelTimer.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTimer.numberOfLines = 0
        labelTimer.preferredMaxLayoutWidth = 1300
        labelTimer.position = CGPoint(x: size.width/2.0, y: size.height/1.42)
        labelTimer.zPosition = 1.5
        addChild(labelTimer)
        
        // MARK: Button
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.name = "buttonHome"
        buttonHome.position = CGPoint(x: size.width/17.0, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 1.5
        addChild(buttonHome)
        
        buttonNextStory.size = CGSize(width: 500, height: 130)
        buttonNextStory.name = "nextStory"
        buttonNextStory.position = CGPoint(x: size.width/1.5, y: size.height/2.8)
        buttonNextStory.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNextStory.zPosition = 6
        buttonNextStory.isHidden = true
        addChild(buttonNextStory)
        
        buttonReplayGame.size = CGSize(width: 500, height: 130)
        buttonReplayGame.name = "replayGame"
        buttonReplayGame.position = CGPoint(x: size.width/2.9, y: size.height/2.8)
        buttonReplayGame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonReplayGame.zPosition = 6
        buttonReplayGame.isHidden = true
        addChild(buttonReplayGame)
        
        buttonTryAgain.size = CGSize(width: 550, height: 110)
        buttonTryAgain.name = "tryAgain"
        buttonTryAgain.position = CGPoint(x: size.width/2.0, y: size.height/3.0)
        buttonTryAgain.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonTryAgain.zPosition = 3.0
        buttonTryAgain.isHidden = true
        addChild(buttonTryAgain)
        
        buttonYes.size = CGSize(width: 350, height: 110)
        buttonYes.name = "buttonYes"
        buttonYes.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        buttonYes.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonYes.zPosition = 3.0
        buttonYes.isHidden = true
        addChild(buttonYes)
        
        buttonNo.size = CGSize(width: 350, height: 110)
        buttonNo.name = "buttonNo"
        buttonNo.position = CGPoint(x: size.width/2.0, y: size.height/2.4)
        buttonNo.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNo.zPosition = 3.0
        buttonNo.isHidden = true
        addChild(buttonNo)
        
        //MARK: PopUp ketika user gagal mancing 10 ikan
        popUpFailed.size = CGSize(width: 1250, height: 750)
        popUpFailed.name = "failed"
        popUpFailed.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        popUpFailed.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpFailed.zPosition = 2.5
        popUpFailed.isHidden = true
        addChild(popUpFailed)
        
        //MARK: PopUp ketika user berhasil mancing 10 ikan
        popUpCongrats.size = CGSize(width: 1250, height: 820)
        popUpCongrats.name = "congrats"
        popUpCongrats.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        popUpCongrats.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpCongrats.zPosition = 2.5
        popUpCongrats.isHidden = true
        addChild(popUpCongrats)
        
        //MARK: PopUp ketika home button diklik
        popUpExit.size = CGSize(width: 800, height: 420)
        popUpExit.name = "exit"
        popUpExit.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        popUpExit.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpExit.zPosition = 2.5
        popUpExit.isHidden = true
        addChild(popUpExit)
        
        //MARK: Sound
        if UserDefaults.standard.bool(forKey: "fxMusic") {
            Sound.sharedInstance.playBacksound(file: "fishPuzzle", fileExtension: "wav")
        }
        
        //MARK: Action Animation
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(swimmingFish), SKAction.wait(forDuration: 4.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(swimmingTrash), SKAction.wait(forDuration: 10.0)])))
        
        //MARK: Timer
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runGameTimer), userInfo: nil, repeats: true)
    }
    
    //MARK: SOURCE CODE MOVE ASSET
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 10.0/3.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        //MARK: Action Animation
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonNoAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonYesAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonTryAgainAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonReplayAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonNextStoryAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func runGameTimer(){
        timeRemaining -= 1
        if timeRemaining < 10 {
            labelTimer.text = "0\(timeRemaining)"
        } else {
            labelTimer.text = "\(timeRemaining)"
        }
        // MARK: Give the time warning!
        if timeRemaining < 6 {
        }
        
        // MARK: Notice the time is up!
        if timeRemaining < 0 {
            gameTimer.invalidate()
            labelTimer.text = "TIMES UP!"
            nonCharacterHook.isHidden = true
            nonCharacterRope.isHidden = true
            nonCharacterHook.removeFromParent()
            nonCharacterRope.removeFromParent()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if (self.totalFishCatched >= 10) {
                    self.gameOverWin()
                } else {
                    self.gameOverLose()
                }
            }
        }
    }
    
    func moveHook(location: CGPoint) {
        let offset = CGPoint(x: location.x - nonCharacterHook.position.x, y: location.y - nonCharacterHook.position.y)
        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat(length), y: offset.y / CGFloat(length))
        
        velocity = CGPoint(x: direction.x * moveHookPointPerSec, y: direction.y * moveHookPointPerSec)
        
    }
    
    func moveSprite(sprite: SKSpriteNode, sprite2: SKSpriteNode, velocity: CGPoint) {
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
        sprite2.position = CGPoint(x: sprite.position.x + amountToMove.x - sprite2.size.width, y: sprite.position.y + amountToMove.y + (sprite.size.height * 12))
    }
    
    func swimmingFish() {
        let purpleFish = SKSpriteNode(imageNamed: "purpleFish")
        purpleFish.name = "purpleFish"
        purpleFish.position = CGPoint(x: size.width + purpleFish.size.width/2, y: CGFloat.random(min: playableRect.minY + purpleFish.size.height/2, max: playableRect.maxY - purpleFish.size.height/2))
        purpleFish.size = CGSize(width: 150, height: 150)
        addChild(purpleFish)
        
        let zebraFish = SKSpriteNode(imageNamed: "zebraFish")
        zebraFish.name = "zebraFish"
        zebraFish.position = CGPoint(x: size.width + zebraFish.size.width/2, y: CGFloat.random(min: playableRect.minY + zebraFish.size.height/2, max: playableRect.maxY - zebraFish.size.height/2))
        zebraFish.size = CGSize(width: 150, height: 150)
        addChild(zebraFish)
        
        let redFish = SKSpriteNode(imageNamed: "redFish")
        redFish.name = "redFish"
        redFish.position = CGPoint(x: -100 + redFish.size.width/2, y: CGFloat.random(min: playableRect.minY + redFish.size.height/2, max: playableRect.maxY - redFish.size.height/2))
        redFish.size = CGSize(width: 180, height: 150)
        addChild(redFish)
        
        let actionMove = SKAction.moveTo(x: -purpleFish.size.width/2, duration: 4.0)
        let actionRemove = SKAction.removeFromParent()
        
        let actionMoveZebraFish = SKAction.moveTo(x: -zebraFish.size.width/2, duration: 4.0)
        let actionRemoveZebraFish = SKAction.removeFromParent()
        
        let actionMoveRedFish = SKAction.moveTo(x: 2200, duration: 4.0)
        let actionRemoveRedFish = SKAction.removeFromParent()
        
        purpleFish.run(SKAction.sequence([actionMove, actionRemove]))
        zebraFish.run(SKAction.sequence([actionMoveZebraFish, actionRemoveZebraFish]))
        redFish.run(SKAction.sequence([actionMoveRedFish, actionRemoveRedFish]))
        
    }
    
    func swimmingTrash() {
        let bottleTrash = SKSpriteNode(imageNamed: "bottle")
        bottleTrash.name = "bottle"
        bottleTrash.position = CGPoint(x: size.width + bottleTrash.size.width/2, y: CGFloat.random(min: playableRect.minY + bottleTrash.size.height/2, max: playableRect.maxY - bottleTrash.size.height/2))
        bottleTrash.size = CGSize(width: 110, height: 180)
        addChild(bottleTrash)
        
        let appleTrash = SKSpriteNode(imageNamed: "apple")
        appleTrash.name = "apple"
        appleTrash.position = CGPoint(x: -100 + appleTrash.size.width/2, y: CGFloat.random(min: playableRect.minY + appleTrash.size.height/2, max: playableRect.maxY - appleTrash.size.height/2))
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
        var hitPurpleFish: [SKSpriteNode] = []
        enumerateChildNodes(withName: "purpleFish") { [self] node, _ in
            let purpleFish = node  as! SKSpriteNode
            if timeRemaining > 0 {
                if purpleFish.frame.intersects(self.nonCharacterHook.frame) {
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(self.soundSucces)
                    }
                    
                    hitPurpleFish.append(purpleFish)
                }
            }
        }
        for purpleFish in hitPurpleFish {
            hookHitPurpleFish(purpleFish: purpleFish)
        }
        
        var hitRedFish: [SKSpriteNode] = []
        enumerateChildNodes(withName: "redFish") { [self] node, _ in
            let redFish = node  as! SKSpriteNode
            if timeRemaining > 0 {
                if redFish.frame.intersects(self.nonCharacterHook.frame) {
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(self.soundSucces)
                    }
                    hitRedFish.append(redFish)
                }
            }
        }
        for redFish in hitRedFish {
            hookHitRedFish(redFish: redFish)
        }
        
        var hitZebraFish: [SKSpriteNode] = []
        enumerateChildNodes(withName: "zebraFish") { [self] node, _ in
            let zebraFish = node  as! SKSpriteNode
            if timeRemaining > 0 {
                if zebraFish.frame.intersects(self.nonCharacterHook.frame) {
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(self.soundSucces)
                    }
                    hitZebraFish.append(zebraFish)
                }
            }
        }
        for zebraFish in hitZebraFish {
            hookHitZebraFish(zebraFish: zebraFish)
        }
        
        var hitBottleTrash: [SKSpriteNode] = []
        enumerateChildNodes(withName: "bottle") { [self] node, _ in
            let bottle = node  as! SKSpriteNode
            if timeRemaining > 0 {
                if bottle.frame.intersects(self.nonCharacterHook.frame) {
                    timeRemaining -= 1
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(self.soundFailed)
                    }
                    
                    hitBottleTrash.append(bottle)
                }
            }
        }
        for bottle in hitBottleTrash {
            hookHitBottle(bottle: bottle)
        }
        
        var hitAppleTrash: [SKSpriteNode] = []
        enumerateChildNodes(withName: "apple") { [self]  node, _ in
            let apple = node  as! SKSpriteNode
            if timeRemaining > 0 {
                if apple.frame.intersects(self.nonCharacterHook.frame) {
                    timeRemaining -= 1
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(self.soundFailed)
                    }
                    hitAppleTrash.append(apple)
                }
            }
        }
        for apple in hitAppleTrash {
            hookHitApple(apple: apple)
        }
    }
    
    func hookHitPurpleFish(purpleFish: SKSpriteNode) {
        purpleFish.removeFromParent()
        totalFishCatched += 1
    }
    
    func hookHitRedFish(redFish: SKSpriteNode) {
        redFish.removeFromParent()
        totalFishCatched += 1
    }
    
    func hookHitZebraFish(zebraFish: SKSpriteNode) {
        zebraFish.removeFromParent()
        totalFishCatched += 1
    }
    
    func hookHitBottle(bottle: SKSpriteNode) {
        bottle.removeFromParent()
    }
    
    func hookHitApple(apple: SKSpriteNode) {
        apple.removeFromParent()
    }
    
    func gameOverLose(){
        backgroundOpacity.isHidden = false
        popUpFailed.isHidden = false
        buttonTryAgain.isHidden = false
    }
    
    func gameOverWin(){
        backgroundOpacity.isHidden = false
        popUpCongrats.isHidden = false
        buttonNextStory.isHidden = false
        buttonReplayGame.isHidden = false
    }
    
    func backToHome(){
        backgroundOpacity.isHidden = false
        popUpExit.isHidden = false
        buttonYes.isHidden = false
        buttonNo.isHidden = false
    }
    
    func backToGame(){
        backgroundOpacity.isHidden = true
        popUpExit.isHidden = true
        buttonYes.isHidden = true
        buttonNo.isHidden = true
    }
    
    func buttonNextStoryScene() {
        Sound.sharedInstance.stopBacksound()
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonNextStory.action(forKey: "Button Next") == nil {
            buttonNextStory.run(SKAction.repeatForever(buttonNextStoryAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene4(size: CGSize(width: 2050, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonBackToHome() {
        Sound.sharedInstance.stopBacksound()
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonYes.action(forKey: "Button Yes") == nil {
            buttonYes.run(SKAction.repeatForever(buttonYesAction!), withKey: "Button Yes")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    func buttonPlayTryAgain() {
        Sound.sharedInstance.stopBacksound()
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonTryAgain.action(forKey: "Button Try") == nil {
            buttonTryAgain.run(SKAction.repeatForever(buttonTryAgainAction!), withKey: "Button Try")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Games1(size: CGSize(width: 2048, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    func buttonbackToHomeScene() {
        Sound.sharedInstance.stopBacksound()
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run(SKAction.repeatForever(buttonHomeAction!), withKey: "Button Home")
            backToHome()
        } else {
            backToHome()
        }
    }
    
    func buttonbackToGame() {
        Sound.sharedInstance.stopBacksound()
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        
        if buttonNo.action(forKey: "Button No") == nil {
            buttonNo.run(SKAction.repeatForever(buttonNoAction!), withKey: "Button No")
            backToGame()
        } else {
            backToGame()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        lastTouchLocation = touchLocation
        moveHook(location: touchLocation)
        
        if atPoint((touch.location(in: self))).name == buttonNextStory.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonNextStory.hasActions(){
                    if node.name == "nextStory" {
                        buttonNextStoryScene()
                    }
                }
            }
        }
        
        if atPoint((touch.location(in: self))).name == buttonHome.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonHome" {
                    buttonbackToHomeScene()
                }
            }
        }
        
        if atPoint((touch.location(in: self))).name == buttonNo.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "buttonNo" {
                    buttonbackToGame()
                }
            }
        }
        
        if atPoint((touch.location(in: self))).name == buttonYes.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonYes.hasActions(){
                    if node.name == "buttonYes" {
                        if UserDefaults.standard.bool(forKey: "fxMusic") {
                            Sound.sharedInstance.playBacksound(file: "startGame", fileExtension: "wav")
                        }
                        buttonBackToHome()
                    }
                }
            }
        }
        
        if atPoint((touch.location(in: self))).name == buttonTryAgain.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "tryAgain" {
                    buttonPlayTryAgain()
                }
            }
        }
        
        if atPoint((touch.location(in: self))).name == buttonReplayGame.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "replayGame" {
                    buttonPlayTryAgain()
                }
            }
        }
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
        
        if let lastTouchLocation = lastTouchLocation {
            let diff = lastTouchLocation - nonCharacterHook.position
            if (diff.length() <= moveHookPointPerSec * CGFloat(dt)) {
                nonCharacterHook.position = lastTouchLocation
                velocity = CGPoint.zero
            } else {
                moveSprite(sprite: nonCharacterHook, sprite2: nonCharacterRope, velocity: velocity)
            }
        }
        
        labelFish.text = "x \(totalFishCatched)"
    }
    
    override func didEvaluateActions() {
        checkCollisions()
    }
}

