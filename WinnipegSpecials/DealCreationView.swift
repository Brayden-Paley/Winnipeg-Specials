//
//  DealCreationView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-08.
//

import Foundation
import SwiftUI

import Combine
import UIKit


/// Publisher to read keyboard changes.
protocol KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> { get }
}

extension KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },
            
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .eraseToAnyPublisher()
    }
}



struct DealCreationView: View , KeyboardReadable{
    var restaurantName: String
    //@State var title: String = ""
    //@State var description: String = ""
    @ObservedObject var price = NumbersOnly(limit: 5)
    @ObservedObject var textBindingManagerTitle = TextBindingManager(limit: 25)
    @ObservedObject var textBindingManagerDescription = TextBindingManager(limit: 50)
    @Environment(\.presentationMode) var presentationMode
    
    @State var everyday: Bool = false
    @State var monday: Bool = false
    @State var tuesday: Bool = false
    @State var wednesday: Bool = false
    @State var thursday: Bool = false
    @State var friday: Bool = false
    @State var saturday: Bool = false
    @State var sunday: Bool = false
    
        
    @State var days: [String] = ["Every day", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var selections: [String] = []
    
    @State var showErrorAlert = false
    @State var showConfirmationAlert = false
    
    @State var isKeyboardVisible = false
    
    let rowHeight = CGFloat(UIScreen.screenHeight*0.05)
    let uniqueDeviceId = UIDevice.current.identifierForVendor!.uuidString
    
    //let keyboardShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    //let keyboardHide = NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)
    
    
    //check if user is banned
    func isBanned(deviceId: String, completion: @escaping (Bool) -> ()){
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/banned/") else {
            print("Error in API endpoint call")
            return
        }
        var foundBannedId = false
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let data = data {
                        do {
                            let fetchedBanned = try JSONDecoder().decode([Banned].self, from: data)
                            DispatchQueue.main.async {
                                    for banned in fetchedBanned{
                                        print("test")
                                        if(banned.deviceId == deviceId){
                                            foundBannedId = true
                                        }
                                    }
                                completion(foundBannedId)
        
                           
                            }
                        } catch let jsonError as NSError {
                            print("failed in isBanned method")
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                          }
                        

                            return
                        }
                }.resume()
    }
    
    func postDeal(deal: Deal){
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/deal") else {
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
    
    init(restaurantName: String){
        self.restaurantName = restaurantName
            UITableView.appearance().backgroundColor =  UIColor(hex: "#e2e2e2ff")
        }
        
    var body: some View {
        ZStack{
            Color(hex: 0xe2e2e2).edgesIgnoringSafeArea(.all)
            Background{
            }
            .zIndex(isKeyboardVisible ? 1 : 0).opacity(0.00001)
            .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                 isKeyboardVisible = newIsKeyboardVisible
     //            backgroundView.opacity(isKeyboardVisible ? 0 : 1)
             }.onTapGesture {
                 UIApplication.shared.endEditing()
             }
            VStack(alignment: .leading, spacing: 10) {
                /*HStack{
                    Text("Select all days that apply")
                }.frame(width: UIScreen.screenWidth, height: 60, alignment: .leading).padding(.top)*/
                HStack{
                    List{
                        Section(header: ListHeader()){
                            ForEach(self.days, id: \.self) { days in
                                MultipleSelectionRow(title: days, isSelected: self.selections.contains(days)) {
                                    if self.selections.contains(days) {
                                        self.selections.removeAll(where: { $0 == days })
                                    }
                                    else {
                                        self.selections.append(days)
                                    }
                                }
                                .alert(isPresented: $showErrorAlert) {
                                    Alert(
                                        title: Text("Please select values for all fields")
                                    )
                                    
                                }
                            }.listRowBackground(Color(hex: 0xe2e2e2))
                        }.textCase(nil)
                    }
                    .environment(\.defaultMinListRowHeight, rowHeight)
                    .frame(height: days.reduce(rowHeight*2) { i, _ in i + rowHeight})
                    //.frame(width: UIScreen.screenWidth, alignment: .center).listRowBackground(Color(hex: 0xe2e2e2))
                    //.frame(height: geometry.size.height, alignment: .center).listRowBackground(Color(hex: 0xe2e2e2))
                }.listStyle(PlainListStyle())
                .background(Color(hex: 0xe2e2e2))
                HStack{
                    TextField(
                        "Title",
                        text: $textBindingManagerTitle.text)
                        .disableAutocorrection(false).frame(width: UIScreen.screenWidth*0.60)
                    TextField(
                        "Price",
                        text: $price.value).keyboardType(.decimalPad).frame(width: UIScreen.screenWidth*0.30)
                    
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    TextField(
                        "Description",
                        text: $textBindingManagerDescription.text)
                        .disableAutocorrection(true).frame(width: UIScreen.screenWidth*0.921)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack(){
                    Button(action: {
                        if(selections.count > 0 && !textBindingManagerTitle.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty && !textBindingManagerDescription.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty && !price.value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty){
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
                            } else if(!everydaySelected && self.monday && self.tuesday && self.wednesday && self.thursday && self.friday && self.saturday && self.sunday){
                                self.everyday = true
                                self.monday = false
                                self.tuesday = false
                                self.wednesday = false
                                self.thursday = false
                                self.friday = false
                                self.saturday = false
                                self.sunday = false
                            }
                            
                            let newDeal = Deal(dealId: UUID().uuidString, restaurant: self.restaurantName, title: self.textBindingManagerTitle.text, description: self.textBindingManagerDescription.text, price: self.price.value, rating: 0, everyday: self.everyday, monday: self.monday, tuesday: self.tuesday, wednesday: self.wednesday, thursday: self.thursday, friday: self.friday, saturday: self.saturday, sunday: self.sunday, reported: false)
                            isBanned(deviceId: uniqueDeviceId, completion: { result in
                                if(!result){
                            postDeal(deal: newDeal)
                                }})
                            showConfirmationAlert = true
                        } else {
                            showErrorAlert = true
                        }
                        
                    }){
                        Text("Create!")
                    }.frame(width: 75, height: 25, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(red: 74 / 255, green: 185 / 255, blue: 237 / 255))
                    .cornerRadius(16)
                    .zIndex(2)
                    
                }.frame(minWidth: 0,
                         maxWidth: .infinity,
                         minHeight: 0,
                         maxHeight: .infinity,
                         alignment: .top)
                .background(Color(hex: 0xe2e2e2))
                
                
            }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading).padding(15)
                .navigationBarTitle(Text("Create A New Deal"), displayMode: .inline)
            
            .alert(isPresented: $showConfirmationAlert){
                Alert(
                    title: Text("Deal Created!"), dismissButton: .default(Text("Thank you!")) {
                        textBindingManagerTitle.text = ""
                        textBindingManagerDescription.text = ""
                        price.value = ""
                        presentationMode.wrappedValue.dismiss()
                    }
            )}.background(Color(hex: 0xe2e2e2)).edgesIgnoringSafeArea(.bottom)
        }
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber || $0 == "." }
            
            if value != filtered {
                value = filtered
            }
            if value.count > characterLimit && oldValue.count <= characterLimit {
                value = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int){
        characterLimit = limit
    }
}

class TextBindingManager: ObservableObject {
    @Published var text: String = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int){
        characterLimit = limit
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

//extension View {
//  func endTextEditing() {
//    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
//                                    to: nil, from: nil, for: nil)
//  }
//}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}

//extension View {
//    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
//        if hidden {
//            if !remove {
//                self.hidden()
//            }
//        } else {
//            self
//        }
//    }
//}

struct ListHeader: View {
    var body: some View {
        HStack {
            Text("Select all days that apply")
        }
    }
}
