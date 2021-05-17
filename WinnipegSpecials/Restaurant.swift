//
//  Restaurant.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-29.
//

import Foundation
import SwiftUI

class Restaurant: NSObject {
    var id = UUID()
    var name: String
    var imageName: String
    var deals: [Deal]
    
    init(name: String, imageName: String, deals: [Deal]) {
        self.name = name
        self.imageName = imageName
        self.deals = deals
    }
    
    
    
    func getDeals(){
        let nameForUrl = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "http://localhost:8080/api/v1/deal/restaurant/" + nameForUrl!) else {
            print("Error in API endpoint call")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        do {
                            let fetchedDeals = try JSONDecoder().decode([Deal].self, from: data)
                                DispatchQueue.main.async {
                                    self.deals = fetchedDeals
                                }
                        } catch let jsonError as NSError {
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                          }
                            return
                        }
                }.resume()
        
    }
}
    
    
//    [Deal(title: "Wine Monday", description:"Red or white", price: "5"),
//     Deal(title: "Fish Tacos", description:"Cod, Avocados, corn tortillas", price: "6")]



var drinkList = [
    Restaurant(name: "Brazen Hall", imageName: "BrazenHallLogo", deals: []),
    Restaurant(name: "Carlos & Murphys", imageName: "Carlos&MurphysLogo", deals: []),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: []),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deals: []),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "The Grove", imageName: "TheGroveLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

]

var mexicanList = [
    Restaurant(name: "BMC", imageName: "BMCLogo", deals: []),
    Restaurant(name: "BurritoDelRio", imageName: "BurritoDelRioLogo", deals: []),
    Restaurant(name: "BurritoSplendido", imageName: "BurritoSpendidoLogo", deals: []),
    Restaurant(name: "Carlos&Murphys", imageName: "Carlos&MurphysLogo", deals: []),
    Restaurant(name: "JCsTaco", imageName: "JCsTacoLogo", deals: []),
    Restaurant(name: "LaCarnita", imageName: "LaCarnitaLogo", deals: []),
    Restaurant(name: "LaRoca", imageName: "LaRocaLogo", deals: []),
    Restaurant(name: "MamaJoes", imageName: "MamaJoesLogo", deals: []),
    Restaurant(name: "MuchoBurrito", imageName: "MuchoBurritoLogo", deals: []),
    Restaurant(name: "Qdoba", imageName: "QdobaLogo", deals: []),
    Restaurant(name: "SargentTaco", imageName: "SargentTacoLogo", deals: []),
    Restaurant(name: "TacoBell", imageName: "TacoBellLogo", deals: []),
    Restaurant(name: "TacoDelMar", imageName: "TacoDelMarLogo", deals: []),
    Restaurant(name: "TacoTime", imageName: "TacoTimeLogo", deals: []),
]

var pastaList = [
    Restaurant(name: "Bellisimo", imageName: "BellisimoLogo", deals: []),
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deals: []),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: []),
    Restaurant(name: "Harth", imageName: "HarthLogo", deals: []),
    Restaurant(name: "InfernosBistro", imageName: "InfernosBistroLogo", deals: []),
    Restaurant(name: "Kevins", imageName: "KevinsLogo", deals: []),
    Restaurant(name: "Maximes", imageName: "MaximesLogo", deals: []),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "OldSpaghettiFactory", imageName: "OldSpaghettiFactoryLogo", deals: []),
    Restaurant(name: "OliveGarden", imageName: "OliveGardenLogo", deals: []),
    Restaurant(name: "Paradise", imageName: "ParadiseLogo", deals: []),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: []),
    Restaurant(name: "Passero", imageName: "PasseroLogo", deals: []),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deals: []),
    Restaurant(name: "TonyRoma", imageName: "TonyRomaLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

    
]

var pizzaList = [
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deals: []),
    Restaurant(name: "BostonPizza", imageName: "BostonPizzaLogo", deals: []),
    Restaurant(name: "DalsRestaurant", imageName: "DalsRestaurantLogo", deals: []),
    Restaurant(name: "Dominos", imageName: "DominosLogo", deals: []),
    Restaurant(name: "GondolaPizza", imageName: "GondolaPizzaLogo", deals: []),
    Restaurant(name: "LittleCaesars", imageName: "LittleCaesarsLogo", deals: []),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "NiakwaPizza", imageName: "NiakwaPizzaLogo", deals: []),
    Restaurant(name: "PapaJohns", imageName: "PapaJohnsLogo", deals: []),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: []),
    Restaurant(name: "PizzaHotline", imageName: "PizzaHotlineLogo", deals: []),
    Restaurant(name: "PizzaHut", imageName: "PizzaHutLogo", deals: []),
    Restaurant(name: "PizzaPizza", imageName: "PizzaPizzaLogo", deals: []),
    Restaurant(name: "PizzaPlace", imageName: "PizzaPlaceLogo", deals: []),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

]

var subAndSandwichList = [
    Restaurant(name: "Bernsteins", imageName: "BernsteinsLogo", deals: []),
    Restaurant(name: "CalabriaMarket", imageName: "CalabriaMarketLogo", deals: []),
    Restaurant(name: "Chachis", imageName: "ChachisLogo", deals: []),
    Restaurant(name: "MrSub", imageName: "MrSubLogo", deals: []),
    Restaurant(name: "NathanDetroit", imageName: "NathanDetroitLogo", deals: []),
    Restaurant(name: "Nicks", imageName: "NicksLogo", deals: []),
    Restaurant(name: "SalisburyHouse", imageName: "SalisburyHouseLogo", deals: []),
    Restaurant(name: "Stellas", imageName: "StellasLogo", deals: []),
    Restaurant(name: "Subway", imageName: "SubwayLogo", deals: []),
    Restaurant(name: "TheFixx", imageName: "TheFixxLogo", deals: []),
    Restaurant(name: "TheGrove", imageName: "TheGroveLogo", deals: []),
]


