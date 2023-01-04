//
//  CustomScrollView.swift
//  Folka
//
//  Created by M. Syulhan Al Ghofany on 22/11/22.
//

import SpriteKit

enum ScrollDirection {
  case vertical
  case horizontal
}

class CustomScrollView: UIScrollView {
  
  //MARK: Static Properties
  static var disabledTouches = false
  private static var scrollView: UIScrollView!
  
  //MARK: Properties
  private let currentScene: SKScene
  private let moveableNode: SKNode
  private let scrollDirection: ScrollDirection
  private var nodesTouched = [AnyObject]()
  
  //MARK: Init
  init(frame: CGRect, scene: SKScene, moveableNode: SKNode, scrollDirection: ScrollDirection) {
    self.currentScene = scene
    self.moveableNode = moveableNode
    self.scrollDirection = scrollDirection
    super.init(frame: frame)
    
    CustomScrollView.scrollView = self
    self.frame = frame
    delegate = self
    indicatorStyle = .white
    isScrollEnabled = true
    isUserInteractionEnabled = true
    showsVerticalScrollIndicator = false
    showsHorizontalScrollIndicator = false
    if scrollDirection == .horizontal {
      let flip = CGAffineTransform(scaleX: -1,y: -1)
      transform = flip
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//MARK: Touches
extension CustomScrollView {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: currentScene)
      guard !CustomScrollView.disabledTouches else { return }
      currentScene.touchesBegan(touches, with: event)
      nodesTouched = currentScene.nodes(at: location)
      for node in nodesTouched {
        node.touchesBegan(touches, with: event)
      }
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: currentScene)
      guard !CustomScrollView.disabledTouches else { return }
      currentScene.touchesMoved(touches, with: event)
      nodesTouched = currentScene.nodes(at: location)
      for node in nodesTouched {
        node.touchesMoved(touches, with: event)
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: currentScene)
      guard !CustomScrollView.disabledTouches else { return }
      currentScene.touchesEnded(touches, with: event)
      nodesTouched = currentScene.nodes(at: location)
      for node in nodesTouched {
        node.touchesEnded(touches, with: event)
      }
    }
  }
  

  override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
    for touch in touches! {
      let location = touch.location(in: currentScene)
      guard !CustomScrollView.disabledTouches else { return }
      currentScene.touchesCancelled(touches!, with: event)
      nodesTouched = currentScene.nodes(at: location)
      for node in nodesTouched {
        node.touchesCancelled(touches!, with: event)
      }
    }
  }
}

//MARK: Touch Controls
extension CustomScrollView {
  class func disable() {
    CustomScrollView.scrollView?.isUserInteractionEnabled = false
    CustomScrollView.disabledTouches = true
  }
  
  class func enable() {
    CustomScrollView.scrollView?.isUserInteractionEnabled = true
    CustomScrollView.disabledTouches = false
  }
}

//MARK: Delegates
extension CustomScrollView: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollDirection == .horizontal {
      moveableNode.position.x = scrollView.contentOffset.x
    } else {
      moveableNode.position.y = scrollView.contentOffset.y
    }
  }
}
