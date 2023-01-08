//
//  EndingStory.swift
//  Folka
//
//  Created by Ferry Julian on 05/12/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_EndingStory: SKScene {
    //MARK: BACKGROUND
    let backgroundEnding = SKSpriteNode(imageNamed: "backgroundEndingStory")
    
    //MARK: BUTTON
    let buttonBeranda = SKSpriteNode(imageNamed: "buttonBackToHome")
    var buttonBerandaAction: SKAction?
    
    //MARK: SOUND/MUSIC
    var clickButton: SKAction = SKAction.playSoundFileNamed("soundClick", waitForCompletion: true)
    
    override func didMove(to view: SKView) {
        //MARK: INIZIALITATION BACKGROUND
        self.backgroundColor = SKColor.white
        
        backgroundEnding.size = CGSize(width: 2050, height: 1050)
        backgroundEnding.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundEnding.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundEnding.zPosition = 0
        addChild(backgroundEnding)
        
        //MARK: INIZIALITATION BUTTON
        buttonBeranda.name = "buttonBeranda"
        buttonBeranda.size = CGSize(width: 800, height: 150)
        buttonBeranda.position = CGPoint(x: size.width/2.0, y: size.height/3.5)
        buttonBeranda.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonBeranda.zPosition = 1
        addChild(buttonBeranda)
    }
    
    override init(size: CGSize){
        //MARK: SK ACTION BUTTON
        let buttonToSmall = SKAction.scaleX(to: 0.9, y: 0.9, duration: 0.3)
        let buttonToBig = SKAction.scaleX(to: 1.0, y: 1.0, duration: 0.3)
        
        buttonBerandaAction = SKAction.sequence([buttonToSmall, buttonToBig])
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: FUNCTION BUTTON HOME
    func buttonHomeScene() {
        if UserDefaults.standard.bool(forKey: "fxSound") {
            run(clickButton)
        }
        if buttonBeranda.action(forKey: "Button Beranda") == nil {
            Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
            buttonBeranda.run(SKAction.repeatForever(buttonBerandaAction!), withKey: "Button Beranda")
            self.view!.window?.rootViewController?.presentedViewController?.presentedViewController?.dismiss(animated: true)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == buttonBeranda.name {
            enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if !self.buttonBeranda.hasActions(){
                    if node.name == "buttonBeranda" {
                        buttonHomeScene()
                    }
                }
            }
        }
    }
}
