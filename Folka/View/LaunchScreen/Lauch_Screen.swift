//
//  LauchScreenViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 05/12/22.
//

import UIKit

class Lauch_Screen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "fxSound")
        UserDefaults.standard.set(true, forKey: "fxMusic")
        
        self.view.addBackground()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
            self.navigationController?.pushViewController(Onboarding_Screen(), animated: false)
        }
    }
}


