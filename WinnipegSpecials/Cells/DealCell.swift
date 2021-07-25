//
//  DealCell.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-19.
//

import Foundation
import SwiftUI

struct DealCell: View {
    var deal: Deal
    var isActive = false
    @State var auths: [Auth] = []
    @State var upvote = false
    @State var downvote = false
    @State var reportDeal = false
    let uniqueDeviceId = UIDevice.current.identifierForVendor!.uuidString
    
    func updateDeal(deal: Deal){
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/deal/" + deal.dealId) else {
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
                                        if(banned.deviceId == deviceId){
                                            foundBannedId = true
                                        }
                                    }
                                completion(foundBannedId)
        
                           
                            }
                        } catch let jsonError as NSError {
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                          }
                        

                            return
                        }
            
                }.resume()
    }
    
    func updateAuth(auth: Auth){
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/auth/") else {
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
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/deal/" + deal.dealId) else {
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
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/auth/deal/"+deal.dealId) else {
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
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/auth/deal/"+deal.dealId) else {
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
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/auth") else {
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
                Text(deal.title).fontWeight(.heavy).frame(width: UIScreen.screenWidth*0.52, alignment: .leading).padding(5)
                Text("$" + String(deal.price)).frame(width: UIScreen.screenWidth*0.18, alignment: .trailing)
                Button(action: {
                    isBanned(deviceId: uniqueDeviceId, completion: { result in
                        if(!result){
                    
                    canVote(deviceId: uniqueDeviceId, upvoted: true, completion: { result, auth in
                        if(!upvote){
                            upvote = true
                            downvote = false
                        }
                        if(result == 0){
                            deal.rating = deal.rating + 1
                            updateDeal(deal: deal)
                            let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId, upvoted: true)
                            postAuth(auth: deviceAuth)
                        } else if (result == 1) {
                            deal.rating = deal.rating + 2
                            updateDeal(deal: deal)
                            auth.upvoted = !auth.upvoted
                            updateAuth(auth: auth)
                        } else if (result == 2){
                            //pop up alert saying youve already voted or do nothing
                        }
                    })
                        } else {
                            //in this block the user is banned by deviceId
                        }
                        
                    })
                }) {
                    Image(systemName: "arrow.up").frame(width: UIScreen.screenWidth*0.10, alignment: .top).foregroundColor(upvote ? Color(hex: 0xe06c36) : .blue)
                }
                
            }
            
            HStack(alignment: .top){
                //plus 8 in this section is hardcoded, would like to change to be %
                Text(deal.description).frame(width: (UIScreen.screenWidth*0.62) + 4, alignment: .leading).padding(5)
                Button(action:{
                    reportDeal = true
                }){
                    Image(systemName: "xmark.octagon").frame(width: UIScreen.screenWidth*0.07, alignment: .trailing).foregroundColor(.red)
                }.alert(isPresented: $reportDeal){
                    Alert(title: Text("Are you sure you want to report this deal?"),
                          primaryButton: .default(Text("Yes!")){
                            //update deal to have reported flag.
                            deal.reported = true
                            updateDeal(deal: deal)
                          },
                          secondaryButton: .destructive(Text("Cancel"))
                    )
                }
                
                Button(action: {
                    isBanned(deviceId: uniqueDeviceId, completion: { result in
                        if(!result){
                            canVote(deviceId: uniqueDeviceId, upvoted: false, completion: { result, auth in
                                if(!downvote){
                                    downvote = true
                                    upvote = false
                                }
                                if(result == 0){
                                    deal.rating = deal.rating - 1
                                    updateDeal(deal: deal)
                                    
                                    if(deal.rating <= -5){
                                        deleteDeal(deal: deal)
                                    }
                                    
                                    let deviceAuth = Auth(authId: UUID().uuidString, deviceId: uniqueDeviceId, dealId: deal.dealId, upvoted: false)
                                    postAuth(auth: deviceAuth)
                                } else if (result == 1) {
                                    deal.rating = deal.rating - 2
                                    updateDeal(deal: deal)
                                    
                                    if(deal.rating <= -5){
                                        deleteDeal(deal: deal)
                                    }
                                    
                                    auth.upvoted = !auth.upvoted
                                    updateAuth(auth: auth)
                                } else if (result == 2){
                                    //pop up alert saying youve already voted or do nothing
                            }
                            })
                        } else{
                            // if we enter this block then the user is banned by deviceId
                        }
                    })
                    })
                     {
                    Image(systemName: "arrow.down").frame(width: UIScreen.screenWidth*0.10, alignment: .top).foregroundColor(downvote ? Color(hex: 0xe06c36) : .blue)
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



