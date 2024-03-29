//
//  Deal.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-14.
//

import Foundation
import SwiftUI

class Deal: Codable {
    var dealId: String
    var restaurant: String
    var title: String
    var description: String
    var price: String
    var rating: Int
    var everyday: Bool
    var monday: Bool
    var tuesday: Bool
    var wednesday: Bool
    var thursday: Bool
    var friday: Bool
    var saturday: Bool
    var sunday: Bool
    var reported: Bool
    
    init(dealId: String, restaurant: String, title: String, description: String, price: String, rating: Int, everyday: Bool, monday: Bool, tuesday: Bool, wednesday: Bool, thursday: Bool, friday: Bool, saturday: Bool, sunday: Bool, reported: Bool){
        self.dealId = dealId
        self.restaurant = restaurant
        self.title = title
        self.description = description
        self.price = price
        self.rating = rating
        self.everyday = everyday
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
        self.reported = reported
    }
}


