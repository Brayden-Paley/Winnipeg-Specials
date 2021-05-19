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
            restaurant.getDeals(){
                sortDealsOnRating()
            }
        })
        
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
    @State var upvote = false
    @State var downvote = false
    let uniqueDeviceId = UIDevice.current.identifierForVendor!.uuidString
    
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
    
    func updateAuth(auth: Auth){
        guard let url = URL(string: "http://localhost:8080/api/v1/auth/") else {
            print("Error in API endpoint call")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
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
    
    
    func canVote(deviceId: String, upvoted: Bool, completion: @escaping (Int, Auth) -> ()){
        var authToUpdate: Auth = Auth(authId: "fakeAuth", deviceId: "fakeAuth", dealId: "fakeAuth", upvoted: false)
        var foundId: Bool = false
        var votesMatch: Bool = false
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
                                            authToUpdate = auth
                                            if(upvoted == auth.upvoted){
                                                votesMatch = true
                                            } else {
                                                votesMatch = false
                                            }
                                        }
                                    }
                                if(!foundId){
                                    completion(0, authToUpdate)
                                } else if (foundId && !votesMatch){
                                    completion(1, authToUpdate)
                                } else if (foundId && votesMatch){
                                    completion(2, authToUpdate)
                                }
                            }
        
                           
                        } catch let jsonError as NSError {
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                          }
                        

                            return
                        }
                }.resume()
    }
    
    func getPreviousVotes(deviceId: String,  completion: @escaping (Int) -> ()){
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
                                            if(auth.upvoted == true){
                                                completion(1)
                                            } else {
                                                //auth.voted == false
                                                completion(0)
                                            }
                                        }
                                    }
                                completion(2)
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
            HStack{
                Text(deal.title).fontWeight(.heavy).frame(width: UIScreen.screenWidth*0.60, alignment: .leading).padding(5)
                Text("$" + String(deal.price)).frame(width: UIScreen.screenWidth*0.10, alignment: .leading)
                Button(action: {
                    
                    canVote(deviceId: uniqueDeviceId, upvoted: true, completion: { result, auth in
                        if(!upvote){
                            upvote = true
                            downvote = false
                        }
                        if(result == 0){
                            deal.rating = deal.rating + 1
                            updateRating(deal: deal)
                            let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId, upvoted: true)
                            postAuth(auth: deviceAuth)
                        } else if (result == 1) {
                            deal.rating = deal.rating + 2
                            updateRating(deal: deal)
                            auth.upvoted = !auth.upvoted
                            updateAuth(auth: auth)
                        } else if (result == 2){
                            //pop up alert saying youve already voted or do nothing
                        }
                    })
                    
                }) {
                    Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top).foregroundColor(upvote ? Color.green : .blue)
                }
                
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, would like to change to be % 
                Text(deal.description).frame(width: (UIScreen.screenWidth*0.70) + 8, alignment: .leading).padding(5)
                
                Button(action: {
                    canVote(deviceId: uniqueDeviceId, upvoted: false, completion: { result, auth in
                        if(!downvote){
                            downvote = true
                            upvote = false
                        }
                        if(result == 0){
                            deal.rating = deal.rating - 1
                            updateRating(deal: deal)
                            
                            if(deal.rating <= -5){
                                deleteDeal(deal: deal)
                            }
                            
                            let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId, upvoted: false)
                            postAuth(auth: deviceAuth)
                        } else if (result == 1) {
                            deal.rating = deal.rating - 2
                            updateRating(deal: deal)
                            
                            if(deal.rating <= -5){
                                deleteDeal(deal: deal)
                            }
                            
                            auth.upvoted = !auth.upvoted
                            updateAuth(auth: auth)
                        } else if (result == 2){
                            //pop up alert saying youve already voted or do nothing
                    }
                    })
                }) {
                    Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top).foregroundColor(downvote ? Color.green : .blue)
                }
                
            }
        }.onAppear(perform: { getPreviousVotes(deviceId: uniqueDeviceId, completion: { result in
            if(result == 0){
                downvote = true
            } else if (result == 1){
                upvote = true
            }
                //result == 2, do nothing
            
        })})
    }
}



