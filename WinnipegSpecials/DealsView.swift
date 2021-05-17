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
        }.animation(.easeOut)
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
    @State var auths: [Auth] = []
    
    func updateRating(deal: Deal){
        guard let url = URL(string: "http://localhost:8080/api/v1/deal/" + deal.dealId) else {
            print("Error in API endpoint call")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")


        
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(deal) else {
            return
        }
        
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
    
    
    func deleteDeal(deal: Deal){
        guard let url = URL(string: "http://localhost:8080/api/v1/deal/" + deal.dealId) else {
            print("Error in API endpoint call")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
    
        let session = URLSession.shared

        session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                } else {
                    print("error in deleting deal")
                }
                
            }.resume()
        
    }
    
    
    func canVote(deviceId: String,  completion: @escaping (Bool) -> ()){
        var foundId: Bool = false
        guard let url = URL(string: "http://localhost:8080/api/v1/auth/deal/"+deal.dealId) else {
            print("Error in API endpoint call")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let data = data {
                        do {
                            
                            let fetchedAuths = try JSONDecoder().decode([Auth].self, from: data)
                            DispatchQueue.main.async {
                                    for auth in fetchedAuths{
                                        if(auth.deviceId == deviceId){
                                            foundId = true
                                        }
                                    }
                                completion(foundId)
                                }
                           
                        } catch let jsonError as NSError {
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                          }
                        

                            return
                        }
                }.resume()
    }
    
    func postAuth(auth: Auth){
        guard let url = URL(string: "http://localhost:8080/api/v1/auth") else {
            print("Error in API endpoint call")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(auth) else {
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
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            let uniqueDeviceId = UIDevice.current.identifierForVendor!.uuidString
            HStack{
                Text(deal.title).fontWeight(.heavy).frame(width: UIScreen.screenWidth*0.60, alignment: .leading).padding(5)
                Text("$" + String(deal.price)).frame(width: UIScreen.screenWidth*0.10, alignment: .leading)
                Button(action: {
                    
                    canVote(deviceId: uniqueDeviceId, completion: { result in
                        if(!result){
                            print(result)
                            deal.rating = deal.rating + 1
                            updateRating(deal: deal)
                            let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId)
                            postAuth(auth: deviceAuth)
                        }
                    })
                    
                }) {
                    Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, would like to change to be % 
                Text(deal.description).frame(width: (UIScreen.screenWidth*0.70) + 8, alignment: .leading).padding(5)
                
                Button(action: {
                    canVote(deviceId: uniqueDeviceId, completion: { result in
                        if(!result){
                            deal.rating = deal.rating - 1
                            updateRating(deal: deal)
                            if(deal.rating <= -5){
                                deleteDeal(deal: deal)
                            }
                            let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId)
                            postAuth(auth: deviceAuth)
                        }
                    })
                }) {
                    Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top)
                }
                
            }
        }
    }
}



