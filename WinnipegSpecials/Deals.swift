//
//  Deals.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-04.
//

import SwiftUI
import Foundation

struct Deals: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .leading) {

            Collapsible(
                label: { Text("Everyday Deals").fontWeight(.heavy) },
                content: {
                    HStack {
                        DealCell()
                        Spacer()
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
        .navigationBarItems(trailing:
                        Button(action: {
                            print("Plus button pressed...")
                        }) {
                            Image(systemName: "plus")
                                                .resizable()
                                                .padding(6)
                                                .frame(width: 24, height: 24)
                                                .background(Color.blue)
                                                .clipShape(Circle())
                                                .foregroundColor(.white)
                        }
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(name).font(.largeTitle).fontWeight(.heavy)
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
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text("Title of the deal").frame(width: UIScreen.screenWidth*0.60, alignment: .leading).background(Color.blue)
                Text("$5").frame(width: UIScreen.screenWidth*0.10, alignment: .leading).background(Color.purple)
                Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top).background(Color.red)
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, definitiely should be changed
                Text("Description of the deal that is long long long long long long").frame(width: (UIScreen.screenWidth*0.70) + 8, alignment: .leading).background(Color.blue)
                Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top).background(Color.red)
            }
        }
    }
}



