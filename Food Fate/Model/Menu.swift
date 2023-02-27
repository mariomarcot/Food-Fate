//
//  Menu.swift
//  Food Fate
//
//  Created by Mario Tromba on 13/01/23.
//

import UIKit

struct Menu {
    let title: String
    let image: UIImage?
}

let menus: [Menu] = [
    Menu(title: "Bread", image: UIImage(named: "bread")),
    Menu(title: "Breakfast", image: UIImage(named: "breakfast")),
    Menu(title: "Dessert", image: UIImage(named: "dessert")),
    Menu(title: "Drink", image: UIImage(named: "drink")),
    Menu(title: "Finger Food", image: UIImage(named: "finger food")),
    Menu(title: "Main Course", image: UIImage(named: "main course")),
    Menu(title: "Marinade", image: UIImage(named: "marinade")),
    Menu(title: "Salad", image: UIImage(named: "salad")),
    Menu(title: "Sauce", image: UIImage(named: "sauce")),
    Menu(title: "Side Dish", image: UIImage(named: "side dish")),
    Menu(title: "Snack", image: UIImage(named: "snack")),
    Menu(title: "Soup", image: UIImage(named: "soup")),
    Menu(title: "Appetizer", image: UIImage(named: "appetizer")),
    Menu(title: "Beverage", image: UIImage(named: "beverage"))
]
