//
//  ContentView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-26.

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(category: categoryList)
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    var category: [Category] = categoryList
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { geometry in
                        ImageCarouselView(numberOfImages: 3) {
                            Image("EarlsLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            Image("PizzaHotlineLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            Image("EarlsLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }.frame(height: 200, alignment: .top)
                    
                    
                    VStack(alignment: .leading, spacing: 20.0) {
                        ForEach(category){ category in
                            CategoryCell(category: category)
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }.padding(.leading, 10).padding(.top, 15)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity,
                           alignment: .topLeading)
                    
                }.navigationBarHidden(true)
            }.background(Color(hex: 0xDAAD86))
        }
    }
}




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
