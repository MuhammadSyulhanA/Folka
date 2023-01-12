//
//  MalinKundang_ViewController.swift
//  Folka
//
//  Created by Ferry Julian on 13/11/22.
//

import UIKit
import SpriteKit
import GameplayKit

class MalinKundang_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "fxMusic") {
            Sound.sharedInstance.playBacksound(file: "startGame", fileExtension: "wav")
        }
        view.backgroundColor = .white
        view = SKView(frame: view.bounds)
        
        if let view = self.view as! SKView? {
            // Initialise the scene
            let scene = MalinKundang_Scene19(size: CGSize(width: 2048, height: 1536))
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.showsPhysics = false
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscapeLeft
        } else {
            return .landscapeRight
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


