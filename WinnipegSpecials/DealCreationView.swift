//
//  DealCreationView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-08.
//

import Foundation
import SwiftUI



struct DealCreationView: View {
    var restaurantName: String
    
    @State private var title: String = ""
    @State private var description: String = ""
    @ObservedObject private var price = NumbersOnly()
        
    @State var days: [String] = ["Every day", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var selections: [String] = []
    
//    @State private var selectedDayIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10){
                List {
                    ForEach(self.days, id: \.self) { days in
                        MultipleSelectionRow(title: days, isSelected: self.selections.contains(days)) {
                            if self.selections.contains(days) {
                                self.selections.removeAll(where: { $0 == days })
                            }
                            else {
                                self.selections.append(days)
                            }
                        }
                    }
                }
            }
            HStack{
                TextField(
                    "Title",
                     text: $title)
                    .disableAutocorrection(false).frame(width: UIScreen.screenWidth*0.60)
                TextField(
                    "Price",
                    text: $price.value).keyboardType(.decimalPad).frame(width: UIScreen.screenWidth*0.20)
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                TextField(
                    "Description",
                    text: $description)
                    .disableAutocorrection(true)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading).padding(15)
            .navigationBarTitle(Text("Create A New Deal"), displayMode: .inline)
            
                
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
