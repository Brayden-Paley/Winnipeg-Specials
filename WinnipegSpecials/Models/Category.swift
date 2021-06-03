//
//  Category.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-26.
//

import Foundation
struct Category: Identifiable {
    var id = UUID()
    var name: String
    var restaurants: [Restaurant]
    
    var imageName: String { return name }
}


var categoryList = [
    Category(name: "Drinks", restaurants: drinkList),
    Category(name: "Mexican", restaurants: mexicanList),
    Category(name: "Pizza", restaurants: pizzaList),
    Category(name: "Pasta",restaurants:  pastaList),
    Category(name: "Subs & Sandwiches", restaurants: subAndSandwichList)
]
