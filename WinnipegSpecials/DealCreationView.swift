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
        
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                List{
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
            }.frame(width: UIScreen.screenWidth, height: 350, alignment: .center)
            HStack{
                TextField(
                    "Title",
                     text: $title)
                    .disableAutocorrection(false).frame(width: UIScreen.screenWidth*0.60)
                TextField(
                    "Price",
                    text: $price.value).keyboardType(.decimalPad).frame(minWidth: 0,
                                                                        maxWidth: .infinity)
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                TextField(
                    "Description",
                    text: $description)
                    .disableAutocorrection(true)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(alignment: .center){
                Button(action: {
                        //Post to db here,
                        print("test")
                    
                }){
                    Text("Create!")
                }.frame(width: 75, height: 25, alignment: .center)
                
                .foregroundColor(.white)
                .background(Color(red: 74 / 255, green: 185 / 255, blue: 237 / 255))
                .cornerRadius(16)
                
            }.frame(minWidth: 0,
                     maxWidth: .infinity,
                     minHeight: 0,
                     maxHeight: .infinity,
                     alignment: .top)
            
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
