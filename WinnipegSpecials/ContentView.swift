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
            }
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
                    ForEach(category.restaurants){ restaurant in
                        RestaurantCell(
                            name: restaurant.name,
                            imageName: restaurant.imageName, destinationText: restaurant.deal)
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
    let destinationText: String
    
    var body: some View {
        NavigationLink(destination: Deals(name: name)) {
            Image(imageName).resizable().frame(width: 80.0, height: 70.0).border(Color.black, width: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
