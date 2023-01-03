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
        Sound.sharedInstance.playBacksound(file: "awalGame", fileExtension: "wav")
        view.backgroundColor = .white
        view = SKView(frame: view.bounds)
        
        if let view = self.view as! SKView? {
            // Initialise the scene
            let scene = MalinKundang_Scene1(size: CGSize(width: 2048, height: 1536))
            // <-- IMPORTANT: Initialise your first scene (as you have no .sks)
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            // Scene properties
            view.showsPhysics = false
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    func rizalKeren() {
        let prevScene = HomePage_ViewController(nibName: "HomePageViewController", bundle: nil)
        self.view?.window?.rootViewController?.present(prevScene, animated: true, completion: nil)
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


