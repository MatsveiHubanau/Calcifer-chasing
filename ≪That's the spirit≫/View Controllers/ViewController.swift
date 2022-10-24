//
//  ViewController.swift
//  ≪That's the spirit≫
//
//  Created by Admin on 12.10.22.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {

    var AudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuGif = UIImage.gifImageWithName("gggif ")
        let imageView = UIImageView(image: menuGif)
        imageView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.width + 10)
        view.addSubview(imageView)
    }
        
        
        
        
        
    @IBAction  func NewGameButton(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "CoreController") as? CoreController,
                  let navController = navigationController else { return }
            navController.pushViewController(destinationViewController, animated: true)
        }
        
    @IBAction func ScoreButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ScoreController") as? ScoreController,
              let navController = navigationController else { return }
        navController.pushViewController(destinationViewController, animated: true)

    }
    
    @IBAction func TitlesButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "TitlesController") as? TitlesController,
                  let navController = navigationController else { return }
            navController.pushViewController(destinationViewController, animated: true)

        }
    
    
    }

