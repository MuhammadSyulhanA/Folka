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

class MalinKundang_Puzzle: SKScene{
  let background = SKSpriteNode(imageNamed: "BackgroundPuzzle")
  let kayuPuzzle = SKSpriteNode(imageNamed: "KayuPuzzle")
  let buttonHome = SKSpriteNode(imageNamed: "ButtonHome")
  let buttonTanya = SKSpriteNode(imageNamed: "ButtonTanya")
  let outlineKapal = SKSpriteNode(imageNamed: "OutlineKapal")
  
  //MARK: PUZZLE KECIL
  let puzzleKecilBadanKapal = SKSpriteNode(imageNamed: "PuzzleKecil_BadanKapal")
  let puzzleKecilAtapKapal = SKSpriteNode(imageNamed: "PuzzleKecil_AtapKapal")
  let puzzleKecilBadanAtasKapal1 = SKSpriteNode(imageNamed: "PuzzleKecil_BadanAtasKapal_1")
  let puzzleKecilBadanAtasKapal2 = SKSpriteNode(imageNamed: "PuzzleKecil_BadanAtasKapal_2")
  let puzzleKecilGarisKapal = SKSpriteNode(imageNamed: "PuzzleKecil_GarisKapal")
  let puzzleKecilJendelaKapal = SKSpriteNode(imageNamed: "PuzzleKecil_JendelaKapal")
  let puzzleKecilPelampung = SKSpriteNode(imageNamed: "PuzzleKecil_Pelampung")
  
  //MARK: PUZZLE BESAR
  let puzzleBesarBadanKapal = SKSpriteNode(imageNamed: "PuzzleBesar_BadanKapal")
  let puzzleBesarAtapKapal = SKSpriteNode(imageNamed: "PuzzleBesar_Atap")
  let puzzleBesarBadanAtasKapal1 = SKSpriteNode(imageNamed: "PuzzleBesar_BadanAtas1")
  let puzzleBesarBadanAtasKapal2 = SKSpriteNode(imageNamed: "PuzzleBesar_BadanAtas2")
  let puzzleBesarGarisKapal = SKSpriteNode(imageNamed: "PuzzleBesar_GarisKapal")
  let puzzleBesarJendelaKapal = SKSpriteNode(imageNamed: "PuzzleBesar_Jendela")
  let puzzleBesarPelampung = SKSpriteNode(imageNamed: "PuzzleBesar_Pelampung")
  
  override init(size: CGSize){
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func didMove(to view: SKView) {
    self.backgroundColor = SKColor.white
    
    //MARK: POSISI PUZZLE KECIL
    background.size = CGSize(width: 2040, height: 1120)
    background.position = CGPoint(x: size.width/2, y: size.height/2)
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.zPosition = -1
    addChild(background)
    
    outlineKapal.size = CGSize(width: 1346, height: 634)
    outlineKapal.position = CGPoint(x: size.width/2.308, y: size.height/2.2)
    outlineKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    outlineKapal.zPosition = 2
    addChild(outlineKapal)
    
    buttonHome.size = CGSize(width: 130, height: 130)
    buttonHome.position = CGPoint(x: size.width/16, y: size.height/1.35)
    buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonHome.zPosition = 0
    addChild(buttonHome)
    
    buttonTanya.size = CGSize(width: 120, height: 120)
    buttonTanya.position = CGPoint(x: size.width/16, y: size.height/1.55)
    buttonTanya.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    buttonTanya.zPosition = 2
    addChild(buttonTanya)
    
    kayuPuzzle.scale(to: CGSize(width: 750, height: 880))
    kayuPuzzle.position = CGPoint(x: size.width/1.03, y: size.height/2)
    kayuPuzzle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    kayuPuzzle.zPosition = 2
    addChild(kayuPuzzle)
    
    puzzleKecilBadanKapal.name = "puzzleKecilBadanKapal"
    puzzleKecilBadanKapal.scale(to: CGSize(width: 320, height: 100))
    puzzleKecilBadanKapal.position = CGPoint(x: size.width/1.11, y: size.height/1.4)
    puzzleKecilBadanKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanKapal.zPosition = 3
    addChild(puzzleKecilBadanKapal)
    
    puzzleKecilPelampung.name = "puzzleKecilPelampung"
    puzzleKecilPelampung.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilPelampung.position = CGPoint(x: size.width/1.1, y: size.height/1.60)
    puzzleKecilPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilPelampung.zPosition = 3
    addChild(puzzleKecilPelampung)
    
    puzzleKecilBadanAtasKapal2.name = "puzzleKecilBadanAtasKapal2"
    puzzleKecilBadanAtasKapal2.scale(to: CGSize(width: 230, height: 90))
    puzzleKecilBadanAtasKapal2.position = CGPoint(x: size.width/1.1, y: size.height/1.85)
    puzzleKecilBadanAtasKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanAtasKapal2.zPosition = 3
    addChild(puzzleKecilBadanAtasKapal2)
    
    puzzleKecilBadanAtasKapal1.name = "puzzleKecilBadanAtasKapal1"
    puzzleKecilBadanAtasKapal1.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilBadanAtasKapal1.position = CGPoint(x: size.width/1.1, y: size.height/2.15)
    puzzleKecilBadanAtasKapal1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilBadanAtasKapal1.zPosition = 3
    addChild(puzzleKecilBadanAtasKapal1)
    
    puzzleKecilAtapKapal.name = "puzzleKecilAtapKapal"
    puzzleKecilAtapKapal.scale(to: CGSize(width: 230, height: 60))
    puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.1, y: size.height/2.55)
    puzzleKecilAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilAtapKapal.zPosition = 3
    addChild(puzzleKecilAtapKapal)
    
    puzzleKecilJendelaKapal.name = "puzzleKecilJendelaKapal"
    puzzleKecilJendelaKapal.scale(to: CGSize(width: 230, height: 100))
    puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.00)
    puzzleKecilJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilJendelaKapal.zPosition = 3
    addChild(puzzleKecilJendelaKapal)
    
    puzzleKecilGarisKapal.name = "puzzleKecilGarisKapal"
    puzzleKecilGarisKapal.scale(to: CGSize(width: 350, height: 70))
    puzzleKecilGarisKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.60)
    puzzleKecilGarisKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleKecilGarisKapal.zPosition = 3
    addChild(puzzleKecilGarisKapal)
    
    //MARK: POSISI PUZZLE BESAR
    puzzleBesarBadanKapal.scale(to: CGSize(width: 1213, height: 391))
    puzzleBesarBadanKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.7)
    puzzleBesarBadanKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanKapal.alpha = 0
    puzzleBesarBadanKapal.zPosition = 2
    addChild(puzzleBesarBadanKapal)
    
    puzzleBesarGarisKapal.scale(to: CGSize(width: 1354, height: 227))
    puzzleBesarGarisKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
    puzzleBesarGarisKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarGarisKapal.zPosition = 2
    puzzleBesarGarisKapal.alpha = 0
    addChild(puzzleBesarGarisKapal)
    
    puzzleBesarPelampung.scale(to: CGSize(width: 248, height: 108))
    puzzleBesarPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
    puzzleBesarPelampung.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarPelampung.zPosition = 4
    puzzleBesarPelampung.alpha = 0
    addChild(puzzleBesarPelampung)
    
    puzzleBesarBadanAtasKapal2.scale(to: CGSize(width: 362, height: 135))
    puzzleBesarBadanAtasKapal2.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
    puzzleBesarBadanAtasKapal2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanAtasKapal2.zPosition = 2
    puzzleBesarBadanAtasKapal2.alpha = 0
    addChild(puzzleBesarBadanAtasKapal2)
    
    puzzleBesarBadanAtasKapal1.scale(to: CGSize(width: 446, height: 253))
    puzzleBesarBadanAtasKapal1.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
    puzzleBesarBadanAtasKapal1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarBadanAtasKapal1.zPosition = 2
    puzzleBesarBadanAtasKapal1.alpha = 0
    addChild(puzzleBesarBadanAtasKapal1)
    
    puzzleBesarAtapKapal.scale(to: CGSize(width: 375, height: 94))
    puzzleBesarAtapKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
    puzzleBesarAtapKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarAtapKapal.zPosition = 3
    puzzleBesarAtapKapal.alpha = 0
    addChild(puzzleBesarAtapKapal)
    
    puzzleBesarJendelaKapal.scale(to: CGSize(width: 246, height: 135))
    puzzleBesarJendelaKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
    puzzleBesarJendelaKapal.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    puzzleBesarJendelaKapal.zPosition = 1
    puzzleBesarJendelaKapal.alpha = 0
    addChild(puzzleBesarJendelaKapal)
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanKapal.name {
        if puzzleKecilBadanKapal.position != puzzleBesarBadanKapal.position{
          puzzleKecilBadanKapal.position = location
          puzzleKecilBadanKapal.scale(to: CGSize(width: 1213, height: 391))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilPelampung.name {
        if puzzleKecilPelampung.position != puzzleBesarPelampung.position{
          puzzleKecilPelampung.position = location
          puzzleKecilPelampung.scale(to: CGSize(width: 248, height: 108))
        }
      }
      
      
      if atPoint((touch.location(in: self))).name == puzzleKecilAtapKapal.name {
        if puzzleKecilAtapKapal.position != puzzleBesarAtapKapal.position{
          puzzleKecilAtapKapal.position = location
          puzzleKecilAtapKapal.scale(to: CGSize(width: 375, height: 94))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKapal.name {
        if puzzleKecilGarisKapal.position != puzzleBesarGarisKapal.position{
          puzzleKecilGarisKapal.position = location
          puzzleKecilGarisKapal.scale(to: CGSize(width: 1354, height: 227))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilGarisKapal.name {
        if puzzleKecilGarisKapal.position != puzzleBesarGarisKapal.position{
          puzzleKecilGarisKapal.position = location
          puzzleKecilGarisKapal.scale(to: CGSize(width: 1354, height: 227))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanAtasKapal1.name {
        if puzzleKecilBadanAtasKapal1.position != puzzleBesarBadanAtasKapal1.position{
          puzzleKecilBadanAtasKapal1.position = location
          puzzleKecilBadanAtasKapal1.scale(to: CGSize(width: 446, height: 253))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilBadanAtasKapal2.name {
        if puzzleKecilBadanAtasKapal2.position != puzzleBesarBadanAtasKapal2.position{
          puzzleKecilBadanAtasKapal2.position = location
          puzzleKecilBadanAtasKapal2.scale(to: CGSize(width: 362, height: 135))
        }
      }
      
      if atPoint((touch.location(in: self))).name == puzzleKecilJendelaKapal.name {
        if puzzleKecilJendelaKapal.position != puzzleBesarJendelaKapal.position{
          puzzleKecilJendelaKapal.position = location
          puzzleKecilJendelaKapal.scale(to: CGSize(width: 246, height: 135))
        }
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame){
      puzzleKecilBadanKapal.position = CGPoint(x: size.width/2.25, y: size.height/2.7)
      puzzleKecilBadanKapal.isUserInteractionEnabled = false
      puzzleKecilBadanKapal.zPosition = 2
    } else{
      self.puzzleKecilBadanKapal.scale(to: CGSize(width: 320, height: 100))
      self.puzzleKecilBadanKapal.position = CGPoint(x: self.size.width/1.11, y: self.size.height/1.4)
    }
    
    if puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame){
      puzzleKecilPelampung.position = CGPoint(x: size.width/1.6, y: size.height/2.4)
      puzzleKecilPelampung.isUserInteractionEnabled = true
      puzzleKecilPelampung.zPosition = 4
    } else{
      puzzleKecilPelampung.position = CGPoint(x: size.width/1.1, y: size.height/1.60)
      puzzleKecilPelampung.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilBadanAtasKapal2.frame.intersects(puzzleBesarBadanAtasKapal2.frame){
      puzzleKecilBadanAtasKapal2.position = CGPoint(x: size.width/1.65, y: size.height/1.98)
      puzzleKecilBadanAtasKapal2.isUserInteractionEnabled = true
    }else{
      puzzleKecilBadanAtasKapal2.position = CGPoint(x: size.width/1.1, y: size.height/1.85)
      puzzleKecilBadanAtasKapal2.scale(to: CGSize(width: 230, height: 90))
    }
    
    if puzzleKecilBadanAtasKapal1.frame.intersects(puzzleBesarBadanAtasKapal1.frame){
      puzzleKecilBadanAtasKapal1.position = CGPoint(x: size.width/2.8, y: size.height/1.8)
      puzzleKecilBadanAtasKapal1.isUserInteractionEnabled = true
    } else{
      puzzleKecilBadanAtasKapal1.position = CGPoint(x: size.width/1.1, y: size.height/2.15)
      puzzleKecilBadanAtasKapal1.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame){
      puzzleKecilAtapKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.6)
      puzzleKecilAtapKapal.isUserInteractionEnabled = true
      puzzleKecilAtapKapal.zPosition = 4
    }else{
      puzzleKecilAtapKapal.position = CGPoint(x: size.width/1.1, y: size.height/2.55)
      puzzleKecilAtapKapal.scale(to: CGSize(width: 230, height: 60))
    }
    
    if puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame){
      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/2.9, y: size.height/1.8)
      puzzleKecilJendelaKapal.isUserInteractionEnabled = true
    } else{
      puzzleKecilJendelaKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.00)
      puzzleKecilJendelaKapal.scale(to: CGSize(width: 230, height: 100))
    }
    
    if puzzleKecilGarisKapal.frame.intersects(puzzleBesarGarisKapal.frame){
      puzzleKecilGarisKapal.position = CGPoint(x: size.width/2.3, y: size.height/2.08)
      puzzleKecilGarisKapal.isUserInteractionEnabled = true
      puzzleKecilGarisKapal.zPosition = 3
    } else{
      puzzleKecilGarisKapal.position = CGPoint(x: size.width/1.1, y: size.height/3.60)
      puzzleKecilGarisKapal.scale(to: CGSize(width: 350, height: 70))
    }
    
    if puzzleKecilBadanKapal.frame.intersects(puzzleBesarBadanKapal.frame) && puzzleKecilPelampung.frame.intersects(puzzleBesarPelampung.frame) && puzzleKecilBadanAtasKapal2.frame.intersects(puzzleBesarBadanAtasKapal2.frame) && puzzleKecilBadanAtasKapal1.frame.intersects(puzzleBesarBadanAtasKapal1.frame) && puzzleKecilAtapKapal.frame.intersects(puzzleBesarAtapKapal.frame) && puzzleKecilJendelaKapal.frame.intersects(puzzleBesarJendelaKapal.frame) && puzzleKecilGarisKapal.frame.intersects(puzzleBesarGarisKapal.frame) {
      print("succes")
    } else{
      print("belum lengkap")
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  }
  
  override func update(_ currentTime: TimeInterval) {
    
  }
  
}

