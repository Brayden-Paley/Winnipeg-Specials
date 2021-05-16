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
    
    @State var title: String = ""
    @State var description: String = ""
    @ObservedObject  var price = NumbersOnly()
    
    @State var everyday: Bool
    @State var monday: Bool
    @State var tuesday: Bool
    @State var wednesday: Bool
    @State var thursday: Bool
    @State var friday: Bool
    @State var saturday: Bool
    @State var sunday: Bool
    
        
    @State var days: [String] = ["Every day", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var selections: [String] = []
    
    func postDeal(deal: Deal){
        guard let url = URL(string: "http://localhost:8080/api/v1/deal") else {
            print("Error in API endpoint call")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(deal) else {
            return
        }
        
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: deal, options: []) else {
//                return
//            }
        
        print(jsonData)
        
        request.httpBody = jsonData
        request.timeoutInterval = 20
        let session = URLSession.shared

        session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        
    }
        
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
                        print("test")
                    var everydaySelected = false
                    for selection in selections{
                        if (selection == "Monday"){
                            self.monday = true
                        } else if (selection == "Tuesday"){
                            self.tuesday = true
                        } else if (selection == "Wednesday"){
                            self.wednesday = true
                        } else if (selection == "Thursday"){
                            self.thursday = true
                        } else if (selection == "Friday"){
                            self.friday = true
                        } else if (selection == "Saturday"){
                            self.saturday = true
                        } else if (selection == "Sunday"){
                            self.sunday = true
                        }
                        if(selection == "Every day"){
                            everydaySelected = true
                        }
                    }
                    if(everydaySelected){
                        self.everyday = true
                        self.monday = false
                        self.tuesday = false
                        self.wednesday = false
                        self.thursday = false
                        self.friday = false
                        self.saturday = false
                        self.sunday = false
                    }
                    
                    let newDeal = Deal(dealId: UUID().uuidString, restaurant: self.restaurantName, title: self.title, description: self.description, price: Int(self.price.value) ?? 0, rating: 0, everyday: self.everyday, monday: self.monday, tuesday: self.tuesday, wednesday: self.wednesday, thursday: self.thursday, friday: self.friday, saturday: self.saturday, sunday: self.sunday)
                    postDeal(deal: newDeal)
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
