//
//  ViewController.swift
//  Food Fate
//
//  Created by Mario Tromba on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var libraryImage: UIImageView!
    @IBOutlet weak var discoverImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestureRecognizer(to: libraryImage, identifier: K.homeViewToMenu)
        addGestureRecognizer(to: discoverImage, identifier: K.homeViewToDiscover)
    
    }
    
    private func addGestureRecognizer(to image: UIImageView, identifier: String) {
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        gestureRec.numberOfTapsRequired = 1
        gestureRec.numberOfTouchesRequired = 1
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(gestureRec)
        image.accessibilityIdentifier = identifier
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let identifier = sender.view?.accessibilityIdentifier else { return }
        presentViewController(identifier: identifier)
    }
    
    private func presentViewController(identifier: String) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: identifier) else { return }
        if viewController is UICollectionViewController {
        } else {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
