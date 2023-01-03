//
//  UIViewController.swift
//  Folka
//
//  Created by PUTRI RAHMADEWI on 03/01/23.
//

import UIKit


extension UIViewController
{
  func setupToHideKeyboardOnTapOnView()
  {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
      target: self,
      action: #selector(UIViewController.dismissKeyboard))
    
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard()
  {
    view.endEditing(true)
  }
}

