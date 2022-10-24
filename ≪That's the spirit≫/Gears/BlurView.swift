//
//  Blurable.swift
//  Calcifer chasing
//
//  Created by Admin on 19.10.22.
//

import UIKit

protocol BlurView where Self:UIView {
    func makeBlur ()
    func deleteBlur () //- оно не работает :(
}

extension BlurView {
    func makeBlur ()  {
      guard !isBlured else {return}
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0
        blurEffectView.tag = 7
        addSubview(blurEffectView)
        
        UIView.animate(withDuration: 3, delay: 1.5, options: .curveEaseInOut, animations: {blurEffectView.alpha = 0.6})
        print("Blured")
    }
    
    func deleteBlur () {
        subviews.filter { $0.tag == 7 }
            .forEach {blurView in
                UIView.animate(withDuration: 3, delay: 1, options: .curveEaseInOut, animations:{
  blurView.alpha = 0
  
                }, completion: {
                    _ in blurView.removeFromSuperview()
                })}
    }
    private var isBlured:Bool {
        var res = false
        subviews.forEach {
            if $0.tag == 7 {
                res = true
            }
        }

  
        return res
  
    }
}


class MyView: UIView, BlurView {
    
}
