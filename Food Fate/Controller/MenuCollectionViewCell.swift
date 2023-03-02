//
//  MenuCollectionViewCell.swift
//  Food Fate
//
//  Created by Mario Tromba on 13/01/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with menu: Menu) {
        iconImageView.image = menu.image
        titleLabel.text = menu.title
    }
}
