//
//  LibraryViewController.swift
//  Food Fate
//
//  Created by Mario Tromba on 13/01/23.
//

import UIKit

class MenuCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeView" {
            if let viewController = segue.destination as? RecipeTableViewController, let row = collectionView.indexPathsForSelectedItems?.first{
                
                viewController.type = menus[row.row].title
                
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MenuCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.menuCell, for: indexPath) as! MenuCollectionViewCell
        cell.setup(with: menus[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 182 , height: 182)
    }
}



