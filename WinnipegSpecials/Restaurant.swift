//
//  Restaurant.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-29.
//

import Foundation
struct Restaurant: Identifiable{
    var id = UUID()
    var name: String
    var imageName: String
    // var deals: deals maybe have a "deals" object that that has the information for the deals, and then restaurants have an array of deals that is sent to it via an API
    //temporary deals as a string
    var deals: [Deal]
}


var testDeal = [Deal(title: "Wine Monday", description:"Red or white", price: "5"),
                Deal(title: "Fish Tacos", description:"Cod, Avocados, corn tortillas", price: "6")]

var drinkList = [
    Restaurant(name: "Brazen Hall", imageName: "BrazenHallLogo", deals: testDeal),
    Restaurant(name: "Carlos & Murphys", imageName: "Carlos&MurphysLogo", deals: testDeal),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: testDeal),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deals: testDeal),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deals: testDeal),
    Restaurant(name: "The Grove", imageName: "TheGroveLogo", deals: testDeal),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: testDeal),

]

var mexicanList = [
    Restaurant(name: "BMC", imageName: "BMCLogo", deals: testDeal),
    Restaurant(name: "BurritoDelRio", imageName: "BurritoDelRioLogo", deals: testDeal),
    Restaurant(name: "BurritoSplendido", imageName: "BurritoSpendidoLogo", deals: testDeal),
    Restaurant(name: "Carlos&Murphys", imageName: "Carlos&MurphysLogo", deals: testDeal),
    Restaurant(name: "JCsTaco", imageName: "JCsTacoLogo", deals: testDeal),
    Restaurant(name: "LaCarnita", imageName: "LaCarnitaLogo", deals: testDeal),
    Restaurant(name: "LaRoca", imageName: "LaRocaLogo", deals: testDeal),
    Restaurant(name: "MamaJoes", imageName: "MamaJoesLogo", deals: testDeal),
    Restaurant(name: "MuchoBurrito", imageName: "MuchoBurritoLogo", deals: testDeal),
    Restaurant(name: "Qdoba", imageName: "QdobaLogo", deals: testDeal),
    Restaurant(name: "SargentTaco", imageName: "SargentTacoLogo", deals: testDeal),
    Restaurant(name: "TacoBell", imageName: "TacoBellLogo", deals: testDeal),
    Restaurant(name: "TacoDelMar", imageName: "TacoDelMarLogo", deals: testDeal),
    Restaurant(name: "TacoTime", imageName: "TacoTimeLogo", deals: testDeal),
]

var pastaList = [
    Restaurant(name: "Bellisimo", imageName: "BellisimoLogo", deals: testDeal),
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deals: testDeal),
    Restaurant(name: "Carne", imageName: "CarneLogo", deals: testDeal),
    Restaurant(name: "Harth", imageName: "HarthLogo", deals: testDeal),
    Restaurant(name: "InfernosBistro", imageName: "InfernosBistroLogo", deals: testDeal),
    Restaurant(name: "Kevins", imageName: "KevinsLogo", deals: testDeal),
    Restaurant(name: "Maximes", imageName: "MaximesLogo", deals: testDeal),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deals: testDeal),
    Restaurant(name: "OldSpaghettiFactory", imageName: "OldSpaghettiFactoryLogo", deals: testDeal),
    Restaurant(name: "OliveGarden", imageName: "OliveGardenLogo", deals: testDeal),
    Restaurant(name: "Paradise", imageName: "ParadiseLogo", deals: testDeal),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: testDeal),
    Restaurant(name: "Passero", imageName: "PasseroLogo", deals: testDeal),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deals: testDeal),
    Restaurant(name: "TonyRoma", imageName: "TonyRomaLogo", deals: testDeal),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: testDeal),

    
]

var pizzaList = [
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deals: testDeal),
    Restaurant(name: "BostonPizza", imageName: "BostonPizzaLogo", deals: testDeal),
    Restaurant(name: "DalsRestaurant", imageName: "DalsRestaurantLogo", deals: testDeal),
    Restaurant(name: "Dominos", imageName: "DominosLogo", deals: testDeal),
    Restaurant(name: "GondolaPizza", imageName: "GondolaPizzaLogo", deals: testDeal),
    Restaurant(name: "LittleCaesars", imageName: "LittleCaesarsLogo", deals: testDeal),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deals: testDeal),
    Restaurant(name: "NiakwaPizza", imageName: "NiakwaPizzaLogo", deals: testDeal),
    Restaurant(name: "PapaJohns", imageName: "PapaJohnsLogo", deals: testDeal),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deals: testDeal),
    Restaurant(name: "PizzaHotline", imageName: "PizzaHotlineLogo", deals: testDeal),
    Restaurant(name: "PizzaHut", imageName: "PizzaHutLogo", deals: testDeal),
    Restaurant(name: "PizzaPizza", imageName: "PizzaPizzaLogo", deals: testDeal),
    Restaurant(name: "PizzaPlace", imageName: "PizzaPlaceLogo", deals: testDeal),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deals: testDeal),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deals: testDeal),

]

var subAndSandwichList = [
    Restaurant(name: "Bernsteins", imageName: "BernsteinsLogo", deals: testDeal),
    Restaurant(name: "CalabriaMarket", imageName: "CalabriaMarketLogo", deals: testDeal),
    Restaurant(name: "Chachis", imageName: "ChachisLogo", deals: testDeal),
    Restaurant(name: "MrSub", imageName: "MrSubLogo", deals: testDeal),
    Restaurant(name: "NathanDetroit", imageName: "NathanDetroitLogo", deals: testDeal),
    Restaurant(name: "Nicks", imageName: "NicksLogo", deals: testDeal),
    Restaurant(name: "SalisburyHouse", imageName: "SalisburyHouseLogo", deals: testDeal),
    Restaurant(name: "Stellas", imageName: "StellasLogo", deals: testDeal),
    Restaurant(name: "Subway", imageName: "SubwayLogo", deals: testDeal),
    Restaurant(name: "TheFixx", imageName: "TheFixxLogo", deals: testDeal),
    Restaurant(name: "TheGrove", imageName: "TheGroveLogo", deals: testDeal),
]


