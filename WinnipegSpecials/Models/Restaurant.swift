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
    
    
    func getDeals(completion: @escaping () -> ()){
        let nameForUrl = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "http://hotspotmysql-env.eba-2fmrzipg.us-east-2.elasticbeanstalk.com/api/v1/deal/restaurant/" + nameForUrl!) else {
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
                                    completion()
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
    Restaurant(name: "Shannons", imageName: "ShannonsLogo", deals: []),
    Restaurant(name: "Montana's", imageName: "MontanasLogo", deals: []),
    Restaurant(name: "Smittys", imageName: "SmittysLogo", deals: []),
    Restaurant(name: "Saffrons", imageName: "SaffronsLogo", deals: []),
    Restaurant(name: "Tavern", imageName: "TavernLogo", deals: []),
    Restaurant(name: "Bar I", imageName: "BarILogo", deals: []),
    Restaurant(name: "The Toad", imageName: "TheToadLogo", deals: []),
    Restaurant(name: "Cornerstone", imageName: "CornerstoneLogo", deals: []),
    Restaurant(name: "Johnny G's", imageName: "JonnyGsLogo", deals: []),
    Restaurant(name: "The Knob", imageName: "TheKnobLogo", deals: []),
    Restaurant(name: "Joey", imageName: "JoeyLogo", deals: []),
    Restaurant(name: "Original Joes", imageName: "OriginalJoesLogo", deals: []),
    Restaurant(name: "Elephant & Castle", imageName: "ElephantAndCastleLogo", deals: []),
    Restaurant(name: "Tapps", imageName: "TappsLogo", deals: []),
    Restaurant(name: "Merchant Kitchen", imageName: "TheMerchantKitchenLogo", deals: []),
    Restaurant(name: "Fionn MacCools", imageName: "FionnMacCoolsLogo", deals: []),
    Restaurant(name: "Cafe22", imageName: "Cafe22Logo", deals: []),
    Restaurant(name: "Browns", imageName: "BrownsLogo", deals: []),
    Restaurant(name: "The Keg", imageName: "TheKegLogo", deals: []),
    Restaurant(name: "Boston Pizza", imageName: "BostonPizzaLogo", deals: []),
    Restaurant(name: "Cibo", imageName: "CiboLogo", deals: []),
    Restaurant(name: "Handsome Daughter", imageName: "HandsomeDaughterLogo", deals: []),
    Restaurant(name: "King's Head", imageName: "KingsHeadLogo", deals: []),
    Restaurant(name: "Peasant Cookery", imageName: "PeasantCookeryLogo", deals: []),
    Restaurant(name: "The Roost", imageName: "TheRoostLogo", deals: []),
    Restaurant(name: "Forth", imageName: "FourthLogo", deals: []),
    Restaurant(name: "Shark Club", imageName: "SharkClubLogo", deals: []),
    Restaurant(name: "The Riverside", imageName: "TheRiversideLogo", deals: []),
    Restaurant(name: "The Hub", imageName: "TheHubLogo", deals: []),
    Restaurant(name: "The Goodwill", imageName: "TheGoodwillLogo", deals: []),
    Restaurant(name: "Local", imageName: "LocalLogo", deals: []),
    Restaurant(name: "Winn City", imageName: "WinnCityLogo", deals: []),
    Restaurant(name: "The Yellow Dog", imageName: "TheYellowDogLogo", deals: []),
    Restaurant(name: "High and Lonesome", imageName: "HighAndLonesomeLogo", deals: []),
    Restaurant(name: "Moxies", imageName: "MoxiesLogo", deals: []),
    Restaurant(name: "Confusion Corner", imageName: "ConfusionCornerLogo", deals: []),
    Restaurant(name: "Tipsy Cow", imageName: "TipsyCowLogo", deals: []),
    Restaurant(name: "Canadian Brewhouse", imageName: "CanadianBrewhouseLogo", deals: []),
    Restaurant(name: "Carlos & Murphys", imageName: "Carlos&MurphysLogo", deals: []),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: []),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deals: []),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "The Grove", imageName: "TheGroveLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

]

var mexicanList = [
    Restaurant(name: "BMC", imageName: "BMCLogo", deals: []),
    Restaurant(name: "Burrito Del Rio", imageName: "BurritoDelRioLogo", deals: []),
    //Restaurant(name: "Burrito Splendido", imageName: "BurritoSpendidoLogo", deals: []),
    Restaurant(name: "Carlos & Murphys", imageName: "Carlos&MurphysLogo", deals: []),
    Restaurant(name: "LaCarnita", imageName: "LaCarnitaLogo", deals: []),
    Restaurant(name: "LaRoca", imageName: "LaRocaLogo", deals: []),
    Restaurant(name: "Mama Joes", imageName: "MamaJoesLogo", deals: []),
    Restaurant(name: "Mucho Burrito", imageName: "MuchoBurritoLogo", deals: []),
    Restaurant(name: "Qdoba", imageName: "QdobaLogo", deals: []),
    Restaurant(name: "Sargent Taco", imageName: "SargentTacoLogo", deals: []),
    Restaurant(name: "Taco Bell", imageName: "TacoBellLogo", deals: []),
    Restaurant(name: "Taco Del Mar", imageName: "TacoDelMarLogo", deals: []),
    Restaurant(name: "Taco Time", imageName: "TacoTimeLogo", deals: []),
    Restaurant(name: "JCs Taco", imageName: "JCsTacoLogo", deals: []),
]

var pastaList = [
    Restaurant(name: "Bellisimo", imageName: "BellisimoLogo", deals: []),
    Restaurant(name: "Bonfire Bistro", imageName: "BonfireBistroLogo", deals: []),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: []),
    Restaurant(name: "Harth", imageName: "HarthLogo", deals: []),
    Restaurant(name: "Infernos Bistro", imageName: "InfernosBistroLogo", deals: []),
    Restaurant(name: "Kevins", imageName: "KevinsLogo", deals: []),
    Restaurant(name: "Maximes", imageName: "MaximesLogo", deals: []),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "Old Spaghetti Factory", imageName: "OldSpaghettiFactoryLogo", deals: []),
    Restaurant(name: "Olive Garden", imageName: "OliveGardenLogo", deals: []),
    Restaurant(name: "Paradise", imageName: "ParadiseLogo", deals: []),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: []),
    Restaurant(name: "Passero", imageName: "PasseroLogo", deals: []),
    Restaurant(name: "Santa Lucia", imageName: "SantaLuciaLogo", deals: []),
    Restaurant(name: "Tony Roma", imageName: "TonyRomaLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

    
]

var pizzaList = [
    Restaurant(name: "Bonfire Bistro", imageName: "BonfireBistroLogo", deals: []),
    Restaurant(name: "Boston Pizza", imageName: "BostonPizzaLogo", deals: []),
    Restaurant(name: "Dals Restaurant", imageName: "DalsRestaurantLogo", deals: []),
    Restaurant(name: "Dominos", imageName: "DominosLogo", deals: []),
    Restaurant(name: "Gondola Pizza", imageName: "GondolaPizzaLogo", deals: []),
    Restaurant(name: "Little Caesars", imageName: "LittleCaesarsLogo", deals: []),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deals: []),
    Restaurant(name: "Niakwa Pizza", imageName: "NiakwaPizzaLogo", deals: []),
    Restaurant(name: "Papa Johns", imageName: "PapaJohnsLogo", deals: []),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: []),
    Restaurant(name: "Pizza Hotline", imageName: "PizzaHotlineLogo", deals: []),
    Restaurant(name: "Pizza Hut", imageName: "PizzaHutLogo", deals: []),
    Restaurant(name: "Pizza Pizza", imageName: "PizzaPizzaLogo", deals: []),
    Restaurant(name: "Pizza Place", imageName: "PizzaPlaceLogo", deals: []),
    Restaurant(name: "Santa Lucia", imageName: "SantaLuciaLogo", deals: []),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: []),

]

var subAndSandwichList = [
    Restaurant(name: "Bernsteins", imageName: "BernsteinsLogo", deals: []),
    Restaurant(name: "Calabria Market", imageName: "CalabriaMarketLogo", deals: []),
    Restaurant(name: "Chachis", imageName: "ChachisLogo", deals: []),
    Restaurant(name: "MrSub", imageName: "MrSubLogo", deals: []),
    Restaurant(name: "Nathan Detroit", imageName: "NathanDetroitLogo", deals: []),
    Restaurant(name: "Nicks", imageName: "NicksLogo", deals: []),
    Restaurant(name: "Salisbury House", imageName: "SalisburyHouseLogo", deals: []),
    Restaurant(name: "Stellas", imageName: "StellasLogo", deals: []),
    Restaurant(name: "Subway", imageName: "SubwayLogo", deals: []),
    Restaurant(name: "The Fixx", imageName: "TheFixxLogo", deals: []),
    Restaurant(name: "The Grove", imageName: "TheGroveLogo", deals: []),
]


