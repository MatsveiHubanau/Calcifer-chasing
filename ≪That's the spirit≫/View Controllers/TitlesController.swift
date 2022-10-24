//
//  TitlesController.swift
//  Calcifer chasing
//
//  Created by Admin on 22.10.22.
//

import UIKit
class TitlesController: UIViewController {
    
    var MyViewVar = MyView()
    
    
    @IBOutlet var withinDoorsImage: BackGroundImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        withinDoorsImage.makeBlur()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        withinDoorsImage.makeBlur()
        
        
    }
}
