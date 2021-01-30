//
//  Restaurant.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-29.
//

import Foundation
struct Restaurant: Identifiable{
    var id = UUID()
    var name: String
    var imageName: String
    // var Deal: deal maybe have a "Deal" object that that has the information for the deal, and then restaurants have an array of deals that is sent to it via an API
    //temporary deal as a string
    var deal: String
}

var drinkList = [
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal"),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal"),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal"),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal"),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal")
]

var mexicanList = [
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal")
]

var pastaList = [
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal")
]

var pizzaList = [
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal")
]

var subAndSandwichList = [
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal")
]


