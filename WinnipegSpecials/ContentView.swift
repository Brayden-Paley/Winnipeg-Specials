//
//  ContentView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-26.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(category: categoryList)
    }
}

struct ContentView: View {
    var category: [Category] = []
    

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20.0){
                    ForEach(category){ category in
                        CategoryCell(category: category)
                    }
                    .navigationBarTitle(Text("Categories"), displayMode: .inline)
                }.padding(.leading, 10).padding(.top, 15)
                .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading)
            }
        }
        
    }
}


struct CategoryCell: View {
    let category: Category
    var body: some View {
        VStack(alignment: .leading){
            Text(category.name).bold().font(.system(size: 20))
            HStack{
                ForEach(category.restaurants){ restaurant in
                    RestaurantCell(imageName: restaurant.imageName, destinationText: restaurant.deal)
                }
            }.frame(minWidth: 0,
                     maxWidth: .infinity,
                     minHeight: 0,
                     maxHeight: .infinity,
                     alignment: .leading)
        }
    }
}

struct RestaurantCell: View {
    let imageName: String
    let destinationText: String
    
    var body: some View {
        NavigationLink(destination: Text(destinationText)) {
            Image(imageName)
        }.buttonStyle(PlainButtonStyle())
    }
}
