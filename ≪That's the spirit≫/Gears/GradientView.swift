//
//  GradientView.swift
//  Calcifer chasing
//
//  Created by Admin on 19.10.22.
//

import UIKit
@IBDesignable
class GradientView:UIView {
    let gradient = CAGradientLayer()
    var colors = [UIColor.white.cgColor, UIColor.white.cgColor]
    
    @IBInspectable
    var firstColor:UIColor {
        set{
            gradient.frame = bounds
            colors[0] = newValue.cgColor
            gradient.colors = colors
            layer.insertSublayer(gradient, at: 0)
        }
        get {
            UIColor(cgColor:colors [0])
        }
    }
    @IBInspectable
    var secondColor:UIColor {
        set {
            gradient.frame = bounds
            colors[1] = newValue.cgColor
            gradient.colors = colors
            layer.insertSublayer(gradient, at: 0)
        }
        get {
            UIColor(cgColor: colors [1])
        }
    }
}
