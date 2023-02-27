//
//  LaucnhScreenViewController.swift
//  Food Fate
//
//  Created by Mario Tromba on 15/01/23.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var launchImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootAnimation () 
        view.addSubview(launchImage)
        DispatchQueue.main.asyncAfter(deadline: .now()+4.5) {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
        
        func rootAnimation () {
            if let animatedImage = UIImage.gif(name: K.launchGif) {
                launchImage.animationImages = animatedImage.images
                launchImage.animationDuration = (animatedImage.duration) / 4
                launchImage.startAnimating()
                
            }
        }
        
    }
    
}
