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
        List {
            Text("First")
        }.font(.largeTitle)
        .navigationTitle(name)
    }
}


