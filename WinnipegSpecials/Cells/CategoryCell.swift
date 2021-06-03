//
//  CategoryCell.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-19.
//

import Foundation
import SwiftUI

struct CategoryCell: View {
    let category: Category
    var body: some View {
        VStack(alignment: .leading){
            Text(category.name).bold().font(.system(size: 20))
            ScrollView(.horizontal) {
                HStack{
                    ForEach(category.restaurants, id:\.name){ restaurant in
                        RestaurantCell(
                            name: restaurant.name,
                            imageName: restaurant.imageName, restaurant: restaurant)
                    }
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .leading)
            }
        }
    }
}
