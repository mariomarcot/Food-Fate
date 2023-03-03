//
//  RecipeTableViewCell.swift
//  Food Fate
//
//  Created by Gustavo Fernandes on 28/02/23.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    static let identifier = "RecipeTableViewCell"
    
    @IBOutlet weak var recipeLabel: UILabel!
    

    func update(_ recipe: Recipe){
        self.recipeLabel.text = recipe.title
        self.recipeLabel.lineBreakMode = .byWordWrapping
    }
}
