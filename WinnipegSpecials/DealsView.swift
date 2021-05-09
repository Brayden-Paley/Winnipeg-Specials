//
//  DealsView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-04.
//

import SwiftUI
import Foundation

struct DealsView: View {
    var restaurantName: String
    var deals: [Deal]
    @State var isActive = false
    
    var body: some View {
        VStack(alignment: .leading) {

            Collapsible(
                label: { Text("Everyday Deals").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        //for each Collapsible cell we will need to hit our API to check for deals, best to cache the deals eventually tho
                        //hardcoded as deals[0] for now but should have SQL parameters that find based on the day + restaurant
                        DealCell(deal: deals[0]).border(Color.black, width: 1)
                        DealCell(deal: deals[1]).border(Color.black, width: 1)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Monday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Tuesday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Wednesday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Thursday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Friday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Saturday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Sunday").fontWeight(.heavy) },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }).frame(maxWidth: .infinity)
            
            
        }
        .padding(.leading, 10).padding(.top, 15)
        .frame(minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading)
        .navigationBarTitleDisplayMode(.inline)
        
        .background(
        NavigationLink(destination: DealCreationView(restaurantName: restaurantName), isActive: $isActive,
         label: { EmptyView() })
     )
     .navigationBarItems(trailing:
                            Button(action: { self.isActive = true }){
                                Image(systemName: "plus")
                                                    .resizable()
                                                    .padding(6)
                                                    .frame(width: 24, height: 24)
                                                    .background(Color.blue)
                                                    .clipShape(Circle()).foregroundColor(.white)
                            })
                .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(restaurantName).font(.largeTitle).fontWeight(.heavy)
                }
            }
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct DealCell: View {
    var deal: Deal
    var isActive = false
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text(deal.title).fontWeight(.heavy).frame(width: UIScreen.screenWidth*0.60, alignment: .leading).padding(5)
                Text("$" + deal.price).frame(width: UIScreen.screenWidth*0.10, alignment: .leading)
                Button(action: {
                    deal.rating = deal.rating + 1
                    //has to update the backend eventually
                }) {
                    Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, would like to change to be % 
                Text(deal.description).frame(width: (UIScreen.screenWidth*0.70) + 8, alignment: .leading).padding(5)
                Button(action: {
                    deal.rating = deal.rating - 1
                    //has to update the backend eventually
                }) {
                    Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
        }
    }
}


struct Deal {
    var title: String
    var description: String
    var price: String
    @State var rating = 0
}
