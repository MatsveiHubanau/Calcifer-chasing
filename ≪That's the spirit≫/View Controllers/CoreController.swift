//
//  CoreController.swift
//  ≪That's the spirit≫
//
//  Created by Admin on 12.10.22.
//
import AVFoundation
import UIKit

class CoreController: UIViewController {
    
  //MARK: Private properties
    let backgroundImage = UIImage(named: "background")
    lazy var backgroundImageView = UIImageView(image:backgroundImage)
    lazy var backgroundImageView2 = UIImageView(image:backgroundImage)
    let dropImage = UIImage(named: "water")
    lazy var dropImageView = UIImageView(image: dropImage)
    lazy var dropImageView2 = UIImageView(image: dropImage)
    lazy var dropImageView3 = UIImageView(image: dropImage)
    var character = UIImage(named: "calcifer")
    lazy var imageViewCharacter = UIImageView(image: character)
    var right = 0
    var left = 0
    var center = 0
   private var Location: Location = .center{
       willSet (newLocation) {
           layoutCharacter(at: newLocation)
      }
    }
    
// MARK: Private methods

    func swipes (to view: UIImageView, direction:UISwipeGestureRecognizer.Direction) {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCharacter))
        gesture.direction = direction
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func moveCharacter(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        switch gestureRecognizer.direction {
        case .left:
            if Location == .center {Location = .left }
            if Location == .right {Location = .center }
        case .right:
            if Location == .center {Location = .right }
            if Location == .left {Location = .center }
        default:
            return
        }
    }
    
    func setupCharacter () {
        view.addSubview(imageViewCharacter)
        imageViewCharacter.frame = CGRect (x: view.frame.width / 2 - 50,
                                           y: view.frame.height / 1.2,
                                           width: 100,
                                           height: 114)
        imageViewCharacter.contentMode = .center
        swipes(to: imageViewCharacter, direction: .right)
        swipes(to: imageViewCharacter, direction: .left)
    }

    func layoutCharacter(at location: Location) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut){
            self.imageViewCharacter.frame.origin.x = self.getOriginX(for: location)
        }
    }
    private func getOriginX (for location: Location) -> CGFloat {
        switch location {
        case .left :
            return 30
        case .center :
            return view.frame.width / 2 - 50
        case .right:
            return view.frame.width - 100
        }
    }
    func intersects () {
        //guard isGaming else {return}
        if checkIntersection(imageViewCharacter, dropImageView) || checkIntersection(imageViewCharacter, dropImageView2) || checkIntersection(imageViewCharacter, dropImageView3) {
            print ("Calcifer become wet")
            dropImageView.layer.removeAllAnimations()
            dropImageView2.layer.removeAllAnimations()
            dropImageView3.layer.removeAllAnimations()
            
            let alert = UIAlertController(title: "Game over!", message: "Calcifer become wet", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Main menu", style: .cancel) {
                _ in self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.intersects()
        }
    }
    func checkIntersection (_ firstView:UIView, _ secondView: UIView) -> Bool {
        guard let firstObject = firstView.layer.presentation()?.frame, 
          let secondObject = secondView.layer.presentation()?.frame else
        { return false }
        return firstObject.intersects(secondObject)
    }
    
    
// MARK: Override methods
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        intersects()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0,
                                           width: view.frame.width,
                                           height: view.frame.height)
        view.addSubview(backgroundImageView2)
        backgroundImageView2.frame = CGRect(x: 0, y: -view.frame.height,
                                           width: view.frame.width,
                                           height: view.frame.height)
        view.addSubview(dropImageView)
        dropImageView.frame = CGRect(x: 30,
                                     y: -400,
                                     width: 70,
                                     height: 70)
        view.addSubview(dropImageView2)
        dropImageView2.frame = CGRect(x: 310,
                                     y: -550,
                                     width: 70,
                                     height: 70)
        view.addSubview(dropImageView3)
        dropImageView3.frame = CGRect(x: 160,
                                     y: -100,
                                     width: 70,
                                     height: 70)
        setupCharacter()
        right = Int(view.frame.width - 100.0)
        center = Int(view.center.x)
        left = Int(30)
    //var ambientSound = AVAudioPlayer()
     //    ambientSound = try!AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: //Bundle.main.path(forResource: "audio", ofType: "mp3")!))
     //   ambientSound.prepareToPlay()
     //   ambientSound.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIImageView.animate(withDuration: 9, delay: 0, options: [.curveLinear, .repeat]) {
            self.backgroundImageView.frame.origin.y += self.view.frame.height
        }
        UIImageView.animate(withDuration: 9, delay: 0, options: [.curveLinear, .repeat]) {
            self.backgroundImageView2.frame.origin.y += self.view.frame.height
        }
        UIImageView.animate(withDuration: 6 , delay: 0, options: [.curveLinear, .repeat]) {
            self.dropImageView.frame.origin.y += 2 * self.view.frame.height
        }
        UIImageView.animate(withDuration: 5.1 , delay: 2.3, options: [.curveLinear, .repeat]) {
            self.dropImageView2.frame.origin.y += 2 * self.view.frame.height
        }
        UIImageView.animate(withDuration: 9 , delay: 5, options: [.curveLinear, .repeat]) {
            self.dropImageView3.frame.origin.y += 2 * self.view.frame.height
        }
    }
}
