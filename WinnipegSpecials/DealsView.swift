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
    var restaurant: Restaurant
    var deals: [Deal]
    @State var isActive = false
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView {
                
            Collapsible(
                label: { Text("Everyday Deals").fontWeight(.heavy)},
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.everyday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Monday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.monday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Tuesday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.tuesday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Wednesday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.wednesday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Thursday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.thursday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Friday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.friday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Saturday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.saturday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }).frame(maxWidth: .infinity)
            Collapsible(
                label: { Text("Sunday").fontWeight(.heavy) },
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.sunday){
                                DealCell(deal: deal).border(Color.black, width: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
        .onAppear(perform: {
                    print("here in deals view")
                    restaurant.getDeals()})
        
        .background(
            NavigationLink(destination: DealCreationView(restaurantName: restaurantName, everyday: false, monday: false,
                                                         tuesday: false, wednesday: false, thursday: false, friday: false,
                                                         saturday: false, sunday: false), isActive: $isActive,
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
                Text("$" + String(deal.price)).frame(width: UIScreen.screenWidth*0.10, alignment: .leading)
                Button(action: {
                    //deal.rating = deal.rating + 1
                    //has to update the backend eventually
                }) {
                    Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, would like to change to be % 
                Text(deal.description).frame(width: (UIScreen.screenWidth*0.70) + 8, alignment: .leading).padding(5)
                Button(action: {
                    //deal.rating = deal.rating - 1
                    //has to update the backend eventually
                }) {
                    Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
        }
    }
}



