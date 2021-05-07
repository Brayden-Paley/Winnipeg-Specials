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
            Text("First")
        }
        .padding(.leading, 10).padding(.top, 15)
        .frame(minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading)
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { 
                        VStack {
                            Text(name).font(.largeTitle).fontWeight(.heavy)
                        }
                    }
                }
    }
}


