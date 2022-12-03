//
//  MalinKundang_Scene13.swift
//  Folka
//
//  Created by M. Syulhan Al Ghofany on 01/12/22.
//

import SpriteKit
import GameplayKit

class MalinKundang_Scene13: SKScene {
    var player: SKSpriteNode?
    var someSprite = SKSpriteNode()
    var floor = SKSpriteNode()
    
    let characterIbuMalin = SKSpriteNode(imageNamed: "ibuMalinScene10")
    
    var kayuScene6 = SKSpriteNode(imageNamed: "kayuScene6")
    
    //MARK: POP UP
    let popUpIntro = SKSpriteNode(imageNamed: "popUpIntroLabirin")
    let popUpHint = SKSpriteNode(imageNamed: "popUpHintLabirin")
    let popUpBerhasil = SKSpriteNode(imageNamed: "popUpBerhasilLabirin")
    
    //MARK: POP UP HINT
    let wayHintLabirin = SKSpriteNode(imageNamed: "wayHintLabirin")
    
    //MARK: BUTTON POPUP
    let buttonMulai = SKSpriteNode(imageNamed: "buttonMulaiIntro")
    let buttonMulaiAction: SKAction?
    let buttonTutupHint = SKSpriteNode(imageNamed: "buttonMulaiIntro")
    let buttonTutupHintAction: SKAction?
    let buttonMainLagi = SKSpriteNode(imageNamed: "buttonMainLagiLabirin")
    let buttonMainLagiAction: SKAction?
    let buttonLanjutkanCerita = SKSpriteNode(imageNamed: "buttonLanjutkanCeritaLabirin")
    let buttonLanjutkanCeritaAction: SKAction?
    
    //MARK: BUTTON
    let buttonHome = SKSpriteNode(imageNamed: "buttonHome")
    let buttonHomeAction: SKAction?
    let buttonTanya = SKSpriteNode(imageNamed: "buttonTanya")
    let buttonTanyaAction: SKAction?
    
    //MARK: TEMBOK LABIRIN
    //Horizontal
    var horizonPanjang1Atas = SKSpriteNode(imageNamed: "horizonPanjang1AtasBawah")
    var horizonPanjang1Bawah = SKSpriteNode(imageNamed: "horizonPanjang1AtasBawah")
    
    var horizonPanjang2Dalam1 = SKSpriteNode(imageNamed: "horizonPanjang2Dalam")
    var horizonPanjang2Dalam2 = SKSpriteNode(imageNamed: "horizonPanjang2Dalam")
    
    var horizonPanjang3Dalam1 = SKSpriteNode(imageNamed: "horizonPanjang3Dalam")
    var horizonPanjang3Dalam2 = SKSpriteNode(imageNamed: "horizonPanjang3Dalam")
    var horizonPanjang3Dalam3 = SKSpriteNode(imageNamed: "horizonPanjang3Dalam")
    
    var horizonPanjang4Dalam1 = SKSpriteNode(imageNamed: "horizonPanjang4Dalam")
    var horizonPanjang4Dalam2 = SKSpriteNode(imageNamed: "horizonPanjang4Dalam")
    var horizonPanjang4Dalam3 = SKSpriteNode(imageNamed: "horizonPanjang4Dalam")
    var horizonPanjang4Dalam4 = SKSpriteNode(imageNamed: "horizonPanjang4Dalam")
    
    //Vertical
    var verticalPanjang1Luar = SKSpriteNode(imageNamed: "verticalPanjang1Luar")
    
    var verticalPanjang2LuarDalam1 = SKSpriteNode(imageNamed: "verticalPanjang2LuarDalam")
    var verticalPanjang2LuarDalam2 = SKSpriteNode(imageNamed: "verticalPanjang2LuarDalam")
    
    var verticalPanjang3LuarDalam1 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam2 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam3 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam4 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam5 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam6 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam7 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam8 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    var verticalPanjang3LuarDalam9 = SKSpriteNode(imageNamed: "verticalPanjang3LuarDalam")
    //MARK: AKHIR TEMBOK LABIRIN
    
    //MARK: HIU
    var sharkKiri = SKSpriteNode(imageNamed: "sharkKiri")
    var sharkKanan1 = SKSpriteNode(imageNamed: "sharkKanan")
    var sharkKanan2 = SKSpriteNode(imageNamed: "sharkKanan")
    var sharkKanan3 = SKSpriteNode(imageNamed: "sharkKanan")
    
    //MARK: PULAU DAN KAPAL
    var pulauFinish = SKSpriteNode(imageNamed: "pulauFinish")
    var kapalLabirin = SKSpriteNode(imageNamed: "kapalLabirin1")
    
    let backgroundOpacity = SKSpriteNode(imageNamed: "opacityBackground")
    let background = SKSpriteNode(imageNamed: "backgroundPuzzle")
    
    override func didMove(to view: SKView) {
        //MARK: BACKGROUND
        self.backgroundColor = SKColor.white
        backgroundOpacity.size = CGSize(width: 2050, height: 1120)
        backgroundOpacity.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundOpacity.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundOpacity.zPosition = 4
        addChild(backgroundOpacity)
        
        background.size = CGSize(width: 2040, height: 1120)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        
        //MARK: POPUP
        popUpIntro.size = CGSize(width: 1350, height: 750)
        popUpIntro.position = CGPoint(x: size.width/2, y: size.height/2)
        popUpIntro.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpIntro.zPosition = 5
        addChild(popUpIntro)
        
        popUpHint.size = CGSize(width: 1350, height: 750)
        popUpHint.position = CGPoint(x: size.width/2, y: size.height/2)
        popUpHint.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpHint.zPosition = 5
        popUpHint.isHidden = true
        addChild(popUpHint)
        
        popUpBerhasil.size = CGSize(width: 1350, height: 750)
        popUpBerhasil.position = CGPoint(x: size.width/2, y: size.height/2)
        popUpBerhasil.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUpBerhasil.zPosition = 5
        popUpBerhasil.isHidden = true
        addChild(popUpBerhasil)
        
        //MARK: POP UP WAY
        wayHintLabirin.size = CGSize(width: 560, height: 230)
        wayHintLabirin.position = CGPoint(x: size.width/2.0, y: size.height/1.85)
        wayHintLabirin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        wayHintLabirin.zPosition = 6
        addChild(wayHintLabirin)
        
        //MARK: BUTTON POPUP
        buttonMulai.size = CGSize(width: 580, height: 130)
        buttonMulai.name = "buttonMulai"
        buttonMulai.position = CGPoint(x: size.width/2, y: size.height/3.2)
        buttonMulai.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonMulai.zPosition = 6
        buttonMulai.isHidden = false
        addChild(buttonMulai)
        
        buttonTutupHint.size = CGSize(width: 580, height: 130)
        buttonTutupHint.name = "buttonTutupHint"
        buttonTutupHint.position = CGPoint(x: size.width/2, y: size.height/3.2)
        buttonTutupHint.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonTutupHint.zPosition = 6
        buttonTutupHint.isHidden = true
        addChild(buttonTutupHint)
        
        buttonMainLagi.size = CGSize(width: 540, height: 130)
        buttonMainLagi.name = "buttonMainLagi"
        buttonMainLagi.position = CGPoint(x: size.width/2.8, y: size.height/2.8)
        buttonMainLagi.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonMainLagi.zPosition = 6
        buttonMainLagi.isHidden = true
        addChild(buttonMainLagi)
        
        buttonLanjutkanCerita.size = CGSize(width: 540, height: 130)
        buttonLanjutkanCerita.name = "buttonLanjutkanCerita"
        buttonLanjutkanCerita.position = CGPoint(x: size.width/1.55, y: size.height/2.8)
        buttonLanjutkanCerita.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonLanjutkanCerita.zPosition = 6
        buttonLanjutkanCerita.isHidden = true
        addChild(buttonLanjutkanCerita)
        
        
        //MARK: BUTTON
        buttonHome.size = CGSize(width: 130, height: 130)
        buttonHome.position = CGPoint(x: size.width/16, y: size.height/1.35)
        buttonHome.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonHome.zPosition = 0
        buttonHome.name = "buttonHome"
        addChild(buttonHome)
        
        buttonTanya.size = CGSize(width: 120, height: 120)
        buttonTanya.position = CGPoint(x: size.width/16, y: size.height/1.55)
        buttonTanya.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        buttonTanya.zPosition = 3
        buttonTanya.name = "buttonTanya"
        addChild(buttonTanya)
        
        
        //kapal
        kapalLabirin.name = "kapalLabirin"
        kapalLabirin.size = CGSize(width: 126, height: 78)
        kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
        kapalLabirin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        kapalLabirin.zPosition = 2
        addChild(kapalLabirin)
        
        //pulau
        pulauFinish.name = "pulauFinish"
        pulauFinish.size = CGSize(width: 156, height: 120)
        pulauFinish.position = CGPoint(x: size.width/1.07, y: size.height/1.69)
        pulauFinish.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pulauFinish.zPosition = 2
        addChild(pulauFinish)
        
        //shark
        let rectsharkKanan1 = CGRect(x: 0, y: 0, width: 200, height: 0)
        let pathsharkKanan1 = CGPath(rect: rectsharkKanan1, transform: nil)
        sharkKanan1.size = CGSize(width: 126, height: 78)
        sharkKanan1.position = CGPoint(x: size.width/2.9, y: size.height/1.69)
        sharkKanan1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sharkKanan1.zPosition = 2
        sharkKanan1.run(SKAction.repeatForever(SKAction.follow(pathsharkKanan1, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(sharkKanan1)
        
        let rectsharkKanan2 = CGRect(x: 0, y: 0, width: 400, height: 0)
        let pathsharkKanan2 = CGPath(rect: rectsharkKanan2, transform: nil)
        sharkKanan2.size = CGSize(width: 126, height: 78)
        sharkKanan2.position = CGPoint(x: size.width/3.7, y: size.height/1.45)
        sharkKanan2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sharkKanan2.zPosition = 2
        sharkKanan2.run(SKAction.repeatForever(SKAction.follow(pathsharkKanan2, asOffset: true, orientToPath: false, duration: 4.0)))
        addChild(sharkKanan2)
        
        let rectsharkKanan3 = CGRect(x: 0, y: 0, width: 400, height: 0)
        let pathsharkKanan3 = CGPath(rect: rectsharkKanan3, transform: nil)
        sharkKanan3.size = CGSize(width: 126, height: 78)
        sharkKanan3.position = CGPoint(x: size.width/1.6, y: size.height/3.2)
        sharkKanan3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sharkKanan3.run(SKAction.repeatForever(SKAction.follow(pathsharkKanan3, asOffset: true, orientToPath: false, duration: 4.0)))
        sharkKanan3.zPosition = 2
        addChild(sharkKanan3)
        
        let rectsharkKiri = CGRect(x: 0, y: 0, width: 0, height: 200)
        let pathsharkKiri = CGPath(rect: rectsharkKiri, transform: nil)
        sharkKiri.size = CGSize(width: 126, height: 78)
        sharkKiri.position = CGPoint(x: size.width/1.32, y: size.height/2.1)
        sharkKiri.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sharkKiri.run(SKAction.repeatForever(SKAction.follow(pathsharkKiri, asOffset: true, orientToPath: false, duration: 4.0)))
        sharkKiri.zPosition = 2
        addChild(sharkKiri)
        
        //1
        horizonPanjang1Atas.size = CGSize(width: 1400, height: 20)
        horizonPanjang1Atas.position = CGPoint(x: size.width/1.8, y: size.height/1.37)
        horizonPanjang1Atas.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang1Atas.zPosition = 2
        addChild(horizonPanjang1Atas)
        
        //2
        verticalPanjang3LuarDalam1.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam1.position = CGPoint(x: size.width/4.55, y: size.height/1.46)
        verticalPanjang3LuarDalam1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam1.zPosition = 2
        addChild(verticalPanjang3LuarDalam1)
        
        //3
        verticalPanjang3LuarDalam2.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam2.position = CGPoint(x: size.width/1.12, y: size.height/1.46)
        verticalPanjang3LuarDalam2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam2.zPosition = 2
        addChild(verticalPanjang3LuarDalam2)
        
        //4
        horizonPanjang3Dalam1.size = CGSize(width: 370, height: 20)
        horizonPanjang3Dalam1.position = CGPoint(x: size.width/3.27, y: size.height/1.56)
        horizonPanjang3Dalam1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang3Dalam1.zPosition = 2
        addChild(horizonPanjang3Dalam1)
        
        //5
        verticalPanjang3LuarDalam3.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam3.position = CGPoint(x: size.width/3.27, y: size.height/1.69)
        verticalPanjang3LuarDalam3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam3.zPosition = 2
        addChild(verticalPanjang3LuarDalam3)
        
        //6
        horizonPanjang4Dalam1.size = CGSize(width: 195, height: 20)
        horizonPanjang4Dalam1.position = CGPoint(x: size.width/2.85, y: size.height/1.83)
        horizonPanjang4Dalam1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang4Dalam1.zPosition = 2
        addChild(horizonPanjang4Dalam1)
        
        //7
        horizonPanjang1Bawah.size = CGSize(width: 1400, height: 20)
        horizonPanjang1Bawah.position = CGPoint(x: size.width/1.8, y: size.height/3.8)
        horizonPanjang1Bawah.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang1Bawah.zPosition = 2
        addChild(horizonPanjang1Bawah)
        
        //8
        verticalPanjang2LuarDalam1.size = CGSize(width: 20, height: 300)
        verticalPanjang2LuarDalam1.position = CGPoint(x: size.width/2.52, y: size.height/2.2)
        verticalPanjang2LuarDalam1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang2LuarDalam1.zPosition = 2
        addChild(verticalPanjang2LuarDalam1)
        
        //9
        horizonPanjang3Dalam2.size = CGSize(width: 400, height: 20)
        horizonPanjang3Dalam2.position = CGPoint(x: size.width/2.5, y: size.height/2.8)
        horizonPanjang3Dalam2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang3Dalam2.zPosition = 2
        addChild(horizonPanjang3Dalam2)
        
        //10
        horizonPanjang4Dalam2.size = CGSize(width: 195, height: 20)
        horizonPanjang4Dalam2.position = CGPoint(x: size.width/3.8, y: size.height/2.2)
        horizonPanjang4Dalam2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang4Dalam2.zPosition = 2
        addChild(horizonPanjang4Dalam2)
        
        //11
        verticalPanjang2LuarDalam2.size = CGSize(width: 20, height: 300)
        verticalPanjang2LuarDalam2.position = CGPoint(x: size.width/4.55, y: size.height/2.8)
        verticalPanjang2LuarDalam2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang2LuarDalam2.zPosition = 2
        addChild(verticalPanjang2LuarDalam2)
        
        //12
        verticalPanjang3LuarDalam4.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam4.position = CGPoint(x: size.width/4.55, y: size.height/2.0)
        verticalPanjang3LuarDalam4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam4.zPosition = 2
        addChild(verticalPanjang3LuarDalam4)
        
        //13
        verticalPanjang3LuarDalam5.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam5.position = CGPoint(x: size.width/2.02, y: size.height/2.5)
        verticalPanjang3LuarDalam5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam5.zPosition = 2
        addChild(verticalPanjang3LuarDalam5)
        
        //14
        horizonPanjang2Dalam1.size = CGSize(width: 650, height: 20)
        horizonPanjang2Dalam1.position = CGPoint(x: size.width/1.54, y: size.height/2.25)
        horizonPanjang2Dalam1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang2Dalam1.zPosition = 2
        addChild(horizonPanjang2Dalam1)
        
        //15
        verticalPanjang3LuarDalam6.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam6.position = CGPoint(x: size.width/1.24, y: size.height/2.5)
        verticalPanjang3LuarDalam6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam6.zPosition = 2
        addChild(verticalPanjang3LuarDalam6)
        
        //16
        verticalPanjang1Luar.size = CGSize(width: 20, height: 450)
        verticalPanjang1Luar.position = CGPoint(x: size.width/1.12, y: size.height/2.45)
        verticalPanjang1Luar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang1Luar.zPosition = 2
        addChild(verticalPanjang1Luar)
        
        //17
        horizonPanjang4Dalam3.size = CGSize(width: 195, height: 20)
        horizonPanjang4Dalam3.position = CGPoint(x: size.width/1.18, y: size.height/1.83)
        horizonPanjang4Dalam3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang4Dalam3.zPosition = 2
        addChild(horizonPanjang4Dalam3)
        
        //18
        verticalPanjang3LuarDalam7.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam7.position = CGPoint(x: size.width/1.24, y: size.height/1.69)
        verticalPanjang3LuarDalam7.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam7.zPosition = 2
        addChild(verticalPanjang3LuarDalam7)
        
        //19
        horizonPanjang2Dalam2.size = CGSize(width: 650, height: 20)
        horizonPanjang2Dalam2.position = CGPoint(x: size.width/1.54, y: size.height/1.56)
        horizonPanjang2Dalam2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang2Dalam2.zPosition = 2
        addChild(horizonPanjang2Dalam2)
        
        //20
        verticalPanjang3LuarDalam8.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam8.position = CGPoint(x: size.width/2.03, y: size.height/1.69)
        verticalPanjang3LuarDalam8.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam8.zPosition = 2
        addChild(verticalPanjang3LuarDalam8)
        
        //21
        horizonPanjang3Dalam3.size = CGSize(width: 400, height: 20)
        horizonPanjang3Dalam3.position = CGPoint(x: size.width/1.7, y: size.height/1.84)
        horizonPanjang3Dalam3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang3Dalam3.zPosition = 2
        addChild(horizonPanjang3Dalam3)
        
        //22
        verticalPanjang3LuarDalam9.size = CGSize(width: 20, height: 150)
        verticalPanjang3LuarDalam9.position = CGPoint(x: size.width/1.72, y: size.height/3.2)
        verticalPanjang3LuarDalam9.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        verticalPanjang3LuarDalam9.zPosition = 2
        addChild(verticalPanjang3LuarDalam9)
        
        //23
        horizonPanjang4Dalam4.size = CGSize(width: 195, height: 20)
        horizonPanjang4Dalam4.position = CGPoint(x: size.width/1.6, y: size.height/2.8)
        horizonPanjang4Dalam4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        horizonPanjang4Dalam4.zPosition = 2
        addChild(horizonPanjang4Dalam4)
        
        //MARK: SK PHYSIC KAPAL
        setUpShipPyhisic(ship: kapalLabirin)
        
        //MARK: SK PHYSIC LINE MAZE
        //Horizontal
        setUpFloorPyhisic(lineMaze: horizonPanjang1Bawah)
        setUpFloorPyhisic(lineMaze: horizonPanjang1Atas)
        
        setUpFloorPyhisic(lineMaze: horizonPanjang2Dalam1)
        setUpFloorPyhisic(lineMaze: horizonPanjang2Dalam2)
        
        setUpFloorPyhisic(lineMaze: horizonPanjang3Dalam1)
        setUpFloorPyhisic(lineMaze: horizonPanjang3Dalam2)
        setUpFloorPyhisic(lineMaze: horizonPanjang3Dalam3)
        
        setUpFloorPyhisic(lineMaze: horizonPanjang4Dalam1)
        setUpFloorPyhisic(lineMaze: horizonPanjang4Dalam2)
        setUpFloorPyhisic(lineMaze: horizonPanjang4Dalam3)
        setUpFloorPyhisic(lineMaze: horizonPanjang4Dalam4)
        
        //Vertical
        setUpFloorPyhisic(lineMaze: verticalPanjang1Luar)
        
        setUpFloorPyhisic(lineMaze: verticalPanjang2LuarDalam1)
        setUpFloorPyhisic(lineMaze: verticalPanjang2LuarDalam2)
        
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam1)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam2)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam3)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam4)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam5)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam6)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam7)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam8)
        setUpFloorPyhisic(lineMaze: verticalPanjang3LuarDalam9)
        
//        characterIbuMalin.name = "ibuMalin"
//        characterIbuMalin.size = CGSize(width: 500, height: 800)
//        characterIbuMalin.position = CGPoint(x: size.width/2.7, y: size.height/1.5)
//        characterIbuMalin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        characterIbuMalin.zPosition = 2
//        addChild(characterIbuMalin)
//
//        kayuScene6.size = CGSize(width: 1100, height: 270)
//        kayuScene6.position = CGPoint(x: size.width/2.2, y: size.height/2.0)
//        kayuScene6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        kayuScene6.zPosition = 2
//        addChild(kayuScene6)
//
//        characterIbuMalin.physicsBody = SKPhysicsBody(circleOfRadius: characterIbuMalin.size.width / 2)
//        characterIbuMalin.physicsBody!.isDynamic = true
//        characterIbuMalin.physicsBody?.allowsRotation = false
//        characterIbuMalin.physicsBody?.affectedByGravity = false
//
    }
    
    func setUpShipPyhisic(ship: SKSpriteNode){
        ship.physicsBody = SKPhysicsBody(circleOfRadius: ship.size.width / 2)
        ship.physicsBody!.isDynamic = true
        ship.physicsBody?.allowsRotation = false
        ship.physicsBody?.affectedByGravity = false
    }
    
    func setUpFloorPyhisic(lineMaze: SKSpriteNode){
        lineMaze.physicsBody = SKPhysicsBody(rectangleOf: lineMaze.size)
        lineMaze.physicsBody?.affectedByGravity = false
        lineMaze.physicsBody?.isDynamic = false
        lineMaze.physicsBody?.allowsRotation = false
    }
    
    func movePlayerToPosition(playerPosition: CGPoint){
        kapalLabirin.position = playerPosition
        
        if kapalLabirin.frame.intersects(sharkKiri.frame) {
            kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
        }
        
        if kapalLabirin.frame.intersects(sharkKanan1.frame) {
            kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
        }
        
        if kapalLabirin.frame.intersects(sharkKanan2.frame) {
            kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
        }
        
        if kapalLabirin.frame.intersects(sharkKanan3.frame) {
            kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
        }
        
        if kapalLabirin.frame.intersects(pulauFinish.frame) {
            popUpBerhasil.isHidden = false
            buttonMainLagi.isHidden = false
            buttonLanjutkanCerita.isHidden = false
            backgroundOpacity.isHidden = false
        }
    }
    
    func buttonMainLagiAksi(){
        popUpBerhasil.isHidden = true
        buttonMainLagi.isHidden = true
        buttonLanjutkanCerita.isHidden = true
        backgroundOpacity.isHidden = true
        kapalLabirin.position = CGPoint(x: size.width/5.5, y: size.height/1.69)
    }
    
    func buttonTutupSceneAksi() {
        popUpIntro.isHidden = true
        buttonMulai.isHidden = true
        wayHintLabirin.isHidden = true
        backgroundOpacity.isHidden = true
    }
    
    func buttonTanyaAksi(){
        popUpHint.isHidden = false
        buttonTutupHint.isHidden = false
        wayHintLabirin.isHidden = false
        backgroundOpacity.isHidden = false
    }
    
    func buttonTutupHintAksi(){
        popUpHint.isHidden = true
        buttonTutupHint.isHidden = true
        wayHintLabirin.isHidden = true
        backgroundOpacity.isHidden = true
    }
    
    override init(size: CGSize){
        buttonTanyaAction = SKAction.resize(toWidth: 120, height: 130, duration: 2.0)
        buttonHomeAction = SKAction.resize(toWidth: 120, height: 130, duration: 2.0)
        buttonMulaiAction = SKAction.resize(toWidth: 550, height: 130, duration: 2.0)
        buttonTutupHintAction = SKAction.resize(toWidth: 550, height: 130, duration: 2.0)
        buttonMainLagiAction = SKAction.resize(toWidth: 550, height: 130, duration: 2.0)
        buttonLanjutkanCeritaAction = SKAction.resize(toWidth: 550, height: 130, duration: 2.0)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let pos : CGPoint = t.location(in: self)
            if atPoint((t.location(in: self))).name == kapalLabirin.name {
              enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "kapalLabirin" {
                    movePlayerToPosition(playerPosition: pos)
                }
              }
            }
        }
        
        let touch = touches.first as UITouch?
        print(atPoint((touch?.location(in: self))!))
        if atPoint((touch?.location(in: self))!).name == buttonMulai.name {
          enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if node.name == "buttonMulai" {
              buttonTutupSceneAksi()
            }
          }
        }
        
        if atPoint((touch?.location(in: self))!).name == buttonTanya.name {
          enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if node.name == "buttonTanya" {
              buttonTanyaAksi()
            }
          }
        }
        
        if atPoint((touch?.location(in: self))!).name == buttonTutupHint.name {
          enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if node.name == "buttonTutupHint" {
              buttonTutupHintAksi()
            }
          }
        }
        
        if atPoint((touch?.location(in: self))!).name == buttonMainLagi.name {
          enumerateChildNodes(withName: "//*") { [self] (node, stop) in
            if node.name == "buttonMainLagi" {
              buttonMainLagiAksi()
            }
          }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let pos : CGPoint = t.location(in: self)
            if atPoint((t.location(in: self))).name == kapalLabirin.name {
              enumerateChildNodes(withName: "//*") { [self] (node, stop) in
                if node.name == "kapalLabirin" {
                    movePlayerToPosition(playerPosition: pos)
                }
              }
            }
        }
        
    }
    
}
