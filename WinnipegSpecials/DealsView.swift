//
//  DealsView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-04.

import SwiftUI
import Foundation

struct DealsView: View {
    var restaurantName: String
    var restaurant: Restaurant
    @State var deals: [Deal]
    @State var isActive = false
    
    func sortDealsOnRating(){
        restaurant.deals.sort(by: { $0.self.rating > $1.self.rating})
    }
    
            
        
    var body: some View {
        VStack(alignment: .leading){
            ScrollView {
                
            Collapsible(
                label: { Text("Everyday Deals").fontWeight(.heavy)},
                content: {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(restaurant.deals, id: \.dealId){ deal in
                            if(deal.everyday){
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
                                DealCell(deal: deal).border(Color.black, width: 1).cornerRadius(3)
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
            restaurant.getDeals(){
                sortDealsOnRating()
            }
        })
        
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
        }.animation(.easeOut).background(Color(hex: 0xe2e2e2)).edgesIgnoringSafeArea(.bottom)
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

