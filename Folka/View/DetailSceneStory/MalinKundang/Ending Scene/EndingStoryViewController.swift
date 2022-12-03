//
//  EndingStoryViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/12/22.
//

import UIKit

class EndingStoryViewController: UIViewController {
  
  @IBOutlet weak var backToBeranda: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let tapBackToBeranda = UITapGestureRecognizer(target: self, action: #selector(self.tapBackToBeranda))
        backToBeranda.addGestureRecognizer(tapBackToBeranda)
      backToBeranda.isUserInteractionEnabled = true
    
    assignbackground()
  }
  
  func assignbackground(){
    let background = UIImage(named: "backgroudBookDetail")
    
    var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = background
    imageView.center = view.center
    view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)
  }
  
  @objc func tapBackToBeranda(sender: UITapGestureRecognizer){
    Sound.sharedInstance.playButton(file: "soundClick", fileExtension: "wav")
    sender.view?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
               UIView.animate(withDuration: 0.3, animations: { () -> Void in
                 sender.view?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
               })
    let controller = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
    present(controller, animated: true, completion: nil)
 }
}
