//
//  RestaurantCell.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-19.
//

import Foundation
import SwiftUI

struct RestaurantCell: View {
    let name: String
    let imageName: String
    let restaurant: Restaurant
    
    var body: some View {
        
        NavigationLink(destination: DealsView(restaurantName: name, restaurant: restaurant, deals: restaurant.deals)) {
            Image(imageName).resizable().frame(width: 80.0, height: 70.0).border(Color.black, width: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
