//
//  MalinKundang_Puzzle.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 18/11/22.
//

import Foundation
import UIKit
import GameplayKit
import SpriteKit

class MalinKundang_Puzzle1: SKScene{
    let moveableNode = SKNode()
    
    //MARK: Pop Up
    let popUpStart = SKSpriteNode(imageNamed: "popUpPuzzleFirst")
    let popUpFinish = SKSpriteNode(imageNamed: "popUpSuccesShipFirst")
    
    //MARK: Background
    let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
    let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
    
    //MARK: Button
    let buttonClose = SKSpriteNode(imageNamed: "buttonClose")
    let buttonCloseAction: SKAction?
    let buttonNextStory = SKSpriteNode(imageNamed: "buttonNextStoryPuzzle")
    var buttonNextStoryAction: SKAction?
    let buttonReplayGame = SKSpriteNode(imageNamed: "buttonPlayAgainPuzzle")
    var buttonReplayAction: SKAction?
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    let buttonHomeAction: SKAction?
    let buttonQuestion = SKSpriteNode(imageNamed: "buttonAsk")
    let buttonQuestionAction: SKAction?
    
    //MARK: Non Character
    let nonCharacterWoodPuzzle  = SKSpriteNode(imageNamed: "woodPuzzle")
    let nonCharacterOutlineShip = SKSpriteNode(imageNamed: "outlineShipFirst")
    
    //MARK: Small Puzzles
    let smallUpperHullPuzzle = SKSpriteNode(imageNamed: "upperHullFirst")
    let smallLowerHullPuzzle = SKSpriteNode(imageNamed: "lowerHullFirst")
    let smallMindshipHullPuzzle = SKSpriteNode(imageNamed: "mindshipHullFirst")
    let smallShipRoundPuzzle = SKSpriteNode(imageNamed: "roundShipFirst")
    let smallShipYellowLinePuzzle = SKSpriteNode(imageNamed: "yellowLineShipFirst")
    let smallShipRoofPuzzle = SKSpriteNode(imageNamed: "roofShipFirst")
    let smallShipManyWindowsPuzzle = SKSpriteNode(imageNamed: "manyWindowsShipFirst")
    let smallShipWindowPuzzle = SKSpriteNode(imageNamed: "windowShipFirst")
    let smallShipFlagPuzzle = SKSpriteNode(imageNamed: "flagShipFirst")
    let smallLifebuoyPuzzle = SKSpriteNode(imageNamed: "lifebouyShipFirst")
    
    //MARK: Big Puzzles
    let bigUpperHullPuzzle = SKSpriteNode(imageNamed: "upperHullFirst")
    let bigLowerHullPuzzle = SKSpriteNode(imageNamed: "lowerHullFirst")
    let bigMindshipHullPuzzle = SKSpriteNode(imageNamed: "mindshipHullFirst")
    let bigShipRoundPuzzle = SKSpriteNode(imageNamed: "roundShipFirst")
    let bigShipYellowLinePuzzle = SKSpriteNode(imageNamed: "yellowLineShipFirst")
    let bigShipRoofPuzzle = SKSpriteNode(imageNamed: "roofShipFirst")
    let bigShipManyWindowsPuzzle = SKSpriteNode(imageNamed: "manyWindowsShipFirst")
    let bigShipWindowPuzzle = SKSpriteNode(imageNamed: "windowShipFirst")
    let bigShipFlagPuzzle = SKSpriteNode(imageNamed: "flagShipFirst")
    let bigLifebuoyPuzzle = SKSpriteNode(imageNamed: "lifebouyShipFirst")
    
    //MARK: Sound and Music
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    var soundSucces: SKAction = SKAction.playSoundFileNamed("soundSucces", waitForCompletion: true)
    var soundFailed: SKAction = SKAction.playSoundFileNamed("soundFailed", waitForCompletion: true)
    
    //MARK: Animation
    override init(size: CGSize){
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        buttonCloseAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonQuestionAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonHomeAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonReplayAction = SKAction.sequence([buttonToSmall, buttonToBig])
        buttonNextStoryAction = SKAction.sequence([buttonToSmall, buttonToBig])
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        //MARK: Background
        backgroundOpacity.size = CGSize(width: 2050, height: 1120)
        backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundOpacity.zPosition = 4
        backgroundOpacity.isHidden = false
        addChild(backgroundOpacity)
        
        background.size = CGSize(width: 2040, height: 1120)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        //MARK: Pop Up
        popUpStart.size = CGSize(width: 1250, height: 820)
        popUpStart.name = "failed"
        popUpStart.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        popUpStart.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpStart.zPosition = 7
        popUpStart.isHidden = false
        addChild(popUpStart)
        
        popUpFinish.size = CGSize(width: 1250, height: 820)
        popUpFinish.name = "failed"
        popUpFinish.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        popUpFinish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpFinish.zPosition = 7
        popUpFinish.isHidden = true
        addChild(popUpFinish)
        
        //MARK: Button
        buttonNextStory.size = CGSize(width: 500, height: 130)
        buttonNextStory.name = "nextStory"
        buttonNextStory.position = CGPoint(x: size.width/1.5, y: size.height/2.8)
        buttonNextStory.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonNextStory.zPosition = 8
        buttonNextStory.isHidden = true
        addChild(buttonNextStory)
        
        buttonReplayGame.size = CGSize(width: 500, height: 130)
        buttonReplayGame.name = "replayGame"
        buttonReplayGame.position = CGPoint(x: size.width/2.9, y: size.height/2.8)
        buttonReplayGame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonReplayGame.zPosition = 8
        buttonReplayGame.isHidden = true
        addChild(buttonReplayGame)
        
        buttonClose.size = CGSize(width: 580, height: 130)
        buttonClose.name = "buttonClose"
        buttonClose.position = CGPoint(x: size.width/2, y: size.height/3.4)
        buttonClose.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonClose.zPosition = 8
        buttonClose.isHidden = false
        addChild( buttonClose)
        
        buttonHome.size = CGSize(width: 150, height: 150)
        buttonHome.position = CGPoint(x: size.width/17, y: size.height/1.38)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 0
        buttonHome.name = "buttonHome"
        addChild(buttonHome)
        
        buttonQuestion.size = CGSize(width: 150, height: 150)
        buttonQuestion.position = CGPoint(x: size.width/17, y: size.height/1.68)
        buttonQuestion.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonQuestion.zPosition = 2
        buttonQuestion.name = "buttonTanya"
        addChild(buttonQuestion)
        
        //MARK: Non Character
        nonCharacterOutlineShip.size = CGSize(width: 1283, height: 719)
        nonCharacterOutlineShip.position = CGPoint(x: size.width/2.308, y: size.height/2.1)
        nonCharacterOutlineShip.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterOutlineShip.zPosition = 2
        addChild(nonCharacterOutlineShip)
        
        nonCharacterWoodPuzzle .scale(to: CGSize(width: 390, height: 1000))
        nonCharacterWoodPuzzle .position = CGPoint(x: size.width/1.13, y: size.height/2)
        nonCharacterWoodPuzzle .anchorPoint = CGPoint(x: 0.5, y: 0.5)
        nonCharacterWoodPuzzle .zPosition = 2
        addChild(nonCharacterWoodPuzzle )
        
        //MARK: Small Puzzles Position
        smallShipRoundPuzzle.name = "smallShipRoundPuzzle"
        smallShipRoundPuzzle.scale(to: CGSize(width: 250, height: 55))
        smallShipRoundPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
        smallShipRoundPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipRoundPuzzle.zPosition = 3
        addChild(smallShipRoundPuzzle)
        
        smallShipRoofPuzzle.name = "smallShipRoofPuzzle"
        smallShipRoofPuzzle.scale(to: CGSize(width: 200, height: 40))
        smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.42)
        smallShipRoofPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipRoofPuzzle.zPosition = 3
        addChild(smallShipRoofPuzzle)
        
        smallShipFlagPuzzle.name = "smallShipFlagPuzzle"
        smallShipFlagPuzzle.scale(to: CGSize(width: 40, height: 60))
        smallShipFlagPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.52)
        smallShipFlagPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipFlagPuzzle.zPosition = 3
        addChild(smallShipFlagPuzzle)
        
        smallShipWindowPuzzle.name = "smallShipWindowPuzzle"
        smallShipWindowPuzzle.scale(to: CGSize(width: 90, height: 60))
        smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.65)
        smallShipWindowPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipWindowPuzzle.zPosition = 3
        addChild(smallShipWindowPuzzle)
        
        smallUpperHullPuzzle.name = "smallUpperHullPuzzle"
        smallUpperHullPuzzle.scale(to: CGSize(width: 200, height: 80))
        smallUpperHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.82)
        smallUpperHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallUpperHullPuzzle.zPosition = 3
        addChild(smallUpperHullPuzzle)
        
        smallShipYellowLinePuzzle.name = "smallShipYellowLinePuzzle"
        smallShipYellowLinePuzzle.scale(to: CGSize(width: 250, height: 50))
        smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
        smallShipYellowLinePuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipYellowLinePuzzle.zPosition = 3
        addChild(smallShipYellowLinePuzzle)
        
        smallMindshipHullPuzzle.name = "smallMindshipHullPuzzle"
        smallMindshipHullPuzzle.scale(to: CGSize(width: 230, height: 70))
        smallMindshipHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.30)
        smallMindshipHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallMindshipHullPuzzle.zPosition = 3
        addChild(smallMindshipHullPuzzle)
        
        smallLifebuoyPuzzle.name = "smallLifebuoyPuzzle"
        smallLifebuoyPuzzle.scale(to: CGSize(width: 70, height: 60))
        smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.60)
        smallLifebuoyPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallLifebuoyPuzzle.zPosition = 3
        addChild(smallLifebuoyPuzzle)
        
        smallShipManyWindowsPuzzle.name = "smallShipManyWindowsPuzzle"
        smallShipManyWindowsPuzzle.scale(to: CGSize(width: 230, height: 70))
        smallShipManyWindowsPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.00)
        smallShipManyWindowsPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallShipManyWindowsPuzzle.zPosition = 3
        addChild(smallShipManyWindowsPuzzle)
        
        smallLowerHullPuzzle.name = "smallLowerHullPuzzle"
        smallLowerHullPuzzle.scale(to: CGSize(width: 250, height: 90))
        smallLowerHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.80)
        smallLowerHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        smallLowerHullPuzzle.zPosition = 3
        addChild(smallLowerHullPuzzle)
        
        
        //MARK: Big Puzzles Position
        bigLowerHullPuzzle.scale(to: CGSize(width: 1200, height: 420))
        bigLowerHullPuzzle.position = CGPoint(x: size.width/2.35, y: size.height/2.68)
        bigLowerHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigLowerHullPuzzle.alpha = 0
        bigLowerHullPuzzle.zPosition = 2
        addChild(bigLowerHullPuzzle)
        
        bigShipYellowLinePuzzle.scale(to: CGSize(width: 1280, height: 200))
        bigShipYellowLinePuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
        bigShipYellowLinePuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipYellowLinePuzzle.zPosition = 3
        bigShipYellowLinePuzzle.alpha = 0
        addChild(bigShipYellowLinePuzzle)
        
        bigMindshipHullPuzzle.scale(to: CGSize(width: 708, height: 174))
        bigMindshipHullPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
        bigMindshipHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigMindshipHullPuzzle.zPosition = 2
        bigMindshipHullPuzzle.alpha = 0
        addChild(bigMindshipHullPuzzle)
        
        bigShipManyWindowsPuzzle.scale(to: CGSize(width: 531, height: 135))
        bigShipManyWindowsPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
        bigShipManyWindowsPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipManyWindowsPuzzle.zPosition = 2
        bigShipManyWindowsPuzzle.alpha = 0
        addChild(bigShipManyWindowsPuzzle)
        
        bigLifebuoyPuzzle.scale(to: CGSize(width: 178, height: 164))
        bigLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
        bigLifebuoyPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigLifebuoyPuzzle.zPosition = 5
        bigLifebuoyPuzzle.alpha = 0
        addChild(bigLifebuoyPuzzle)
        
        bigShipRoundPuzzle.scale(to: CGSize(width: 578, height: 177))
        bigShipRoundPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
        bigShipRoundPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipRoundPuzzle.zPosition = 4
        bigShipRoundPuzzle.alpha = 0
        addChild(bigShipRoundPuzzle)
        
        bigShipFlagPuzzle.scale(to: CGSize(width: 95, height: 155))
        bigShipFlagPuzzle.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
        bigShipFlagPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipFlagPuzzle.zPosition = 3
        bigShipFlagPuzzle.alpha = 0
        addChild(bigShipFlagPuzzle)
        
        bigUpperHullPuzzle.scale(to: CGSize(width: 334, height: 189))
        bigUpperHullPuzzle.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
        bigUpperHullPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigUpperHullPuzzle.zPosition = 2
        bigUpperHullPuzzle.alpha = 0
        addChild(bigUpperHullPuzzle)
        
        bigShipWindowPuzzle.scale(to: CGSize(width: 125, height: 83))
        bigShipWindowPuzzle.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
        bigShipWindowPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipWindowPuzzle.zPosition = 3
        bigShipWindowPuzzle.alpha = 0
        addChild(bigShipWindowPuzzle)
        
        bigShipRoofPuzzle.scale(to: CGSize(width: 401, height: 73))
        bigShipRoofPuzzle.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
        bigShipRoofPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bigShipRoofPuzzle.zPosition = 3
        bigShipRoofPuzzle.alpha = 0
        addChild(bigShipRoofPuzzle)
        
        if UserDefaults.standard.bool(forKey: "fxMusic") {
            Sound.sharedInstance.playBacksound(file: "fishPuzzle", fileExtension: "wav")
        }
        
    }
    
    //MARK: Touches
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(touch.location(in: self)).name == smallShipRoundPuzzle.name {
                if smallShipRoundPuzzle.position != bigShipRoundPuzzle.position{
                    smallShipRoundPuzzle.position = location
                    smallShipRoundPuzzle.zPosition = 4
                    smallShipRoundPuzzle.scale(to: CGSize(width: 578, height: 177))
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipRoofPuzzle.name {
                if smallShipRoofPuzzle.position != bigShipRoofPuzzle.position{
                    smallShipRoofPuzzle.position = location
                    smallShipRoofPuzzle.zPosition = 3
                    smallShipRoofPuzzle.scale(to: CGSize(width: 401, height: 73))
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipFlagPuzzle.name {
                if smallShipFlagPuzzle.position != bigShipFlagPuzzle.position{
                    smallShipFlagPuzzle.position = location
                    smallShipFlagPuzzle.zPosition = 3
                    smallShipFlagPuzzle.scale(to: CGSize(width: 95, height: 155))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallShipWindowPuzzle.name {
                if smallShipWindowPuzzle.position != bigShipWindowPuzzle.position{
                    smallShipWindowPuzzle.position = location
                    smallShipWindowPuzzle.zPosition = 4
                    smallShipWindowPuzzle.scale(to: CGSize(width: 125, height: 83))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallUpperHullPuzzle.name {
                if smallUpperHullPuzzle.position != bigUpperHullPuzzle.position{
                    smallUpperHullPuzzle.position = location
                    smallUpperHullPuzzle.zPosition = 3
                    smallUpperHullPuzzle.scale(to: CGSize(width: 334, height: 189))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallShipYellowLinePuzzle.name {
                if smallShipYellowLinePuzzle.position != bigShipYellowLinePuzzle.position{
                    smallShipYellowLinePuzzle.position = location
                    smallShipYellowLinePuzzle.zPosition = 5
                    smallShipYellowLinePuzzle.scale(to: CGSize(width: 1280, height: 200))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallMindshipHullPuzzle.name {
                if smallMindshipHullPuzzle.position != bigMindshipHullPuzzle.position{
                    smallMindshipHullPuzzle.position = location
                    smallMindshipHullPuzzle.zPosition = 3
                    smallMindshipHullPuzzle.scale(to: CGSize(width: 708, height: 174))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallLifebuoyPuzzle.name {
                if smallLifebuoyPuzzle.position != bigLifebuoyPuzzle.position{
                    smallLifebuoyPuzzle.position = location
                    smallLifebuoyPuzzle.zPosition = 6
                    smallLifebuoyPuzzle.scale(to: CGSize(width: 178, height: 164))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallShipManyWindowsPuzzle.name {
                if smallShipManyWindowsPuzzle.position != bigShipManyWindowsPuzzle.position{
                    smallShipManyWindowsPuzzle.position = location
                    smallShipManyWindowsPuzzle.zPosition = 4
                    smallShipManyWindowsPuzzle.scale(to: CGSize(width: 531, height: 135))
                }
            }
            
            if atPoint((touch.location(in: self))).name == smallLowerHullPuzzle.name {
                if smallLowerHullPuzzle.position != bigLowerHullPuzzle.position{
                    smallLowerHullPuzzle.position = location
                    smallLowerHullPuzzle.zPosition = 3
                    smallLowerHullPuzzle.scale(to: CGSize(width: 1200, height: 420))
                }
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if atPoint(touch.location(in: self)).name == smallShipRoundPuzzle.name {
                if smallShipRoundPuzzle.frame.intersects(bigShipRoundPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    
                    smallShipRoundPuzzle.position = CGPoint(x: size.width/2.9, y: size.height/2.7)
                    smallShipRoundPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipRoundPuzzle.scale(to: CGSize(width: 250, height: 55))
                    smallShipRoundPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.32)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipRoofPuzzle.name {
                if smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallShipRoofPuzzle.position = CGPoint(x: size.width/1.76, y: size.height/1.46)
                    smallShipRoofPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipRoofPuzzle.scale(to: CGSize(width: 200, height: 40))
                    smallShipRoofPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.42)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipFlagPuzzle.name {
                if smallShipFlagPuzzle.frame.intersects(bigShipFlagPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallShipFlagPuzzle.position = CGPoint(x: size.width/2.5, y: size.height/1.66)
                    smallShipFlagPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipFlagPuzzle.scale(to: CGSize(width: 40, height: 60))
                    smallShipFlagPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.52)
                    
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipWindowPuzzle.name {
                if smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallShipWindowPuzzle.position = CGPoint(x: size.width/1.80, y: size.height/1.6)
                    smallShipWindowPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipWindowPuzzle.scale(to: CGSize(width: 90, height: 60))
                    smallShipWindowPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.65)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallUpperHullPuzzle.name {
                if smallUpperHullPuzzle.frame.intersects(bigUpperHullPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallUpperHullPuzzle.position = CGPoint(x: size.width/1.76, y: size.height/1.65)
                    smallUpperHullPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallUpperHullPuzzle.scale(to: CGSize(width: 200, height: 80))
                    smallUpperHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/1.82)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipYellowLinePuzzle.name {
                if smallShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallShipYellowLinePuzzle.position = CGPoint(x: size.width/2.3, y: size.height/2.1)
                    smallShipYellowLinePuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipYellowLinePuzzle.scale(to: CGSize(width: 250, height: 50))
                    smallShipYellowLinePuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.00)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallMindshipHullPuzzle.name {
                if smallMindshipHullPuzzle.frame.intersects(bigMindshipHullPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallMindshipHullPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
                    smallMindshipHullPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallMindshipHullPuzzle.scale(to: CGSize(width: 230, height: 70))
                    smallMindshipHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.30)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallLifebuoyPuzzle.name {
                if smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.6, y: size.height/2.5)
                    smallLifebuoyPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallLifebuoyPuzzle.scale(to: CGSize(width: 70, height: 60))
                    smallLifebuoyPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/2.60)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallShipManyWindowsPuzzle.name {
                if smallShipManyWindowsPuzzle.frame.intersects(bigShipManyWindowsPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallShipManyWindowsPuzzle.position = CGPoint(x: size.width/2, y: size.height/2)
                    smallShipManyWindowsPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallShipManyWindowsPuzzle.scale(to: CGSize(width: 230, height: 70))
                    smallShipManyWindowsPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.00)
                }
            }
            
            if atPoint(touch.location(in: self)).name == smallLowerHullPuzzle.name {
                if smallLowerHullPuzzle.frame.intersects(bigLowerHullPuzzle.frame){
                    if UserDefaults.standard.bool(forKey: "fxSound") {
                        run(soundSucces)
                    }
                    smallLowerHullPuzzle.position = CGPoint(x: size.width/2.35, y: size.height/2.68)
                    smallLowerHullPuzzle.inputView?.isMultipleTouchEnabled = false
                } else{
                    smallLowerHullPuzzle.scale(to: CGSize(width: 250, height: 90))
                    smallLowerHullPuzzle.position = CGPoint(x: size.width/1.13, y: size.height/3.80)
                }
            }
            
            if smallUpperHullPuzzle.frame.intersects(bigUpperHullPuzzle.frame) && smallLowerHullPuzzle.frame.intersects(bigLowerHullPuzzle.frame) && smallMindshipHullPuzzle.frame.intersects(bigMindshipHullPuzzle.frame) && smallShipRoundPuzzle.frame.intersects(bigShipRoundPuzzle.frame) && bigShipYellowLinePuzzle.frame.intersects(bigShipYellowLinePuzzle.frame) && smallShipRoofPuzzle.frame.intersects(bigShipRoofPuzzle.frame) && smallShipWindowPuzzle.frame.intersects(bigShipWindowPuzzle.frame) && smallShipManyWindowsPuzzle.frame.intersects(bigShipManyWindowsPuzzle.frame) && smallShipFlagPuzzle.frame.intersects(bigShipFlagPuzzle.frame) && smallLifebuoyPuzzle.frame.intersects(bigLifebuoyPuzzle.frame){
                gameFinish()
            } else{
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touch = touches.first as UITouch?
            if atPoint((touch?.location(in: self))!).name == buttonClose.name {
                enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                    if node.name == "buttonClose" {
                        buttonCloseSceneAksi()
                    }
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == buttonQuestion.name {
                enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                    if node.name == "buttonTanya" {
                        buttonTanyaAksi()
                    }
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == buttonHome.name {
                enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                    if node.name == "buttonHome" {
                        buttonHomeAksi()
                    }
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == buttonReplayGame.name {
                enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                    if node.name == "replayGame" {
                        buttonBackToGame()
                    }
                }
            }
            
            if atPoint((touch?.location(in: self))!).name == buttonNextStory.name {
                enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                    if node.name == "nextStory" {
                        buttonNextStoryScene()
                    }
                }
            }
        }
    }
    
    func buttonCloseSceneAksi() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        popUpStart.isHidden = true
        buttonClose.isHidden = true
        backgroundOpacity.isHidden = true
    }
    
    func buttonBackToGame() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        let reveal = SKTransition.reveal(with: .right, duration: 1)
        let prevScene = MalinKundang_ChooseShip(size: CGSize(width: 2048, height: 1536))
        prevScene.scaleMode = .aspectFill
        scene?.view!.presentScene(prevScene, transition: reveal)
    }
    
    func gameFinish(){
        backgroundOpacity.isHidden = false
        popUpFinish.isHidden = false
        buttonNextStory.isHidden = false
        buttonReplayGame.isHidden = false
    }
    
    func buttonTanyaAksi(){
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        popUpStart.isHidden = false
        buttonClose.isHidden = false
        backgroundOpacity.isHidden = false
    }
    
    func buttonHomeAksi(){
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonHome.action(forKey: "Button Home") == nil {
            buttonHome.run((buttonHomeAction!), withKey: "Button Home")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
        }
    }
    
    func buttonNextStoryScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonNextStory.action(forKey: "Button Next") == nil {
            buttonNextStory.run(SKAction.repeatForever(buttonNextStoryAction!), withKey: "Button Next")
            let reveal = SKTransition.reveal(with: .left, duration: 1)
            let newScene = MalinKundang_Scene6(size: CGSize(width: 2050, height: 1536))
            newScene.scaleMode = .aspectFill
            scene?.view!.presentScene(newScene, transition: reveal)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}

