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
    // var deal: Deal maybe have a "Deal" object that that has the information for the deal, and then restaurants have an array of deals that is sent to it via an API
    //temporary deal as a string
    var deal: String
}

var drinkList = [
    Restaurant(name: "Brazen Hall", imageName: "BrazenHallLogo", deal: "test Deal"),
    Restaurant(name: "Carlos & Murphys", imageName: "Carlos&MurphysLogo", deal: "test Deal"),
    Restaurant(name: "Carne", imageName: "CarneLogo", deal: "test Deal"),
    Restaurant(name: "Earls", imageName: "EarlsLogo", deal: "test Deal"),
    Restaurant(name: "Mona Lisa", imageName: "MonaLisaLogo", deal: "test Deal"),
    Restaurant(name: "The Grove", imageName: "TheGroveLogo", deal: "test Deal"),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deal: "test Deal"),

]

var mexicanList = [
    Restaurant(name: "BMC", imageName: "BMCLogo", deal: "test Deal"),
    Restaurant(name: "BurritoDelRio", imageName: "BurritoDelRioLogo", deal: "test Deal"),
    Restaurant(name: "BurritoSplendido", imageName: "BurritoSpendidoLogo", deal: "test Deal"),
    Restaurant(name: "Carlos&Murphys", imageName: "Carlos&MurphysLogo", deal: "test Deal"),
    Restaurant(name: "JCsTaco", imageName: "JCsTacoLogo", deal: "test Deal"),
    Restaurant(name: "LaCarnita", imageName: "LaCarnitaLogo", deal: "test Deal"),
    Restaurant(name: "LaRoca", imageName: "LaRocaLogo", deal: "test Deal"),
    Restaurant(name: "MamaJoes", imageName: "MamaJoesLogo", deal: "test Deal"),
    Restaurant(name: "MuchoBurrito", imageName: "MuchoBurritoLogo", deal: "test Deal"),
    Restaurant(name: "Qdoba", imageName: "QdobaLogo", deal: "test Deal"),
    Restaurant(name: "SargentTaco", imageName: "SargentTacoLogo", deal: "test Deal"),
    Restaurant(name: "TacoBell", imageName: "TacoBellLogo", deal: "test Deal"),
    Restaurant(name: "TacoDelMar", imageName: "TacoDelMarLogo", deal: "test Deal"),
    Restaurant(name: "TacoTime", imageName: "TacoTimeLogo", deal: "test Deal"),
]

var pastaList = [
    Restaurant(name: "Bellisimo", imageName: "BellisimoLogo", deal: "test Deal"),
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deal: "test Deal"),
    Restaurant(name: "Carne", imageName: "CarneLogo", deal: "test Deal"),
    Restaurant(name: "Harth", imageName: "HarthLogo", deal: "test Deal"),
    Restaurant(name: "InfernosBistro", imageName: "InfernosBistroLogo", deal: "test Deal"),
    Restaurant(name: "Kevins", imageName: "KevinsLogo", deal: "test Deal"),
    Restaurant(name: "Maximes", imageName: "MaximesLogo", deal: "test Deal"),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deal: "test Deal"),
    Restaurant(name: "OldSpaghettiFactory", imageName: "OldSpaghettiFactoryLogo", deal: "test Deal"),
    Restaurant(name: "OliveGarden", imageName: "OliveGardenLogo", deal: "test Deal"),
    Restaurant(name: "Paradise", imageName: "ParadiseLogo", deal: "test Deal"),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deal: "test Deal"),
    Restaurant(name: "Passero", imageName: "PasseroLogo", deal: "test Deal"),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deal: "test Deal"),
    Restaurant(name: "TonyRoma", imageName: "TonyRomaLogo", deal: "test Deal"),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deal: "test Deal"),

    
]

var pizzaList = [
    Restaurant(name: "BonfireBistro", imageName: "BonfireBistroLogo", deal: "test Deal"),
    Restaurant(name: "BostonPizza", imageName: "BostonPizzaLogo", deal: "test Deal"),
    Restaurant(name: "DalsRestaurant", imageName: "DalsRestaurantLogo", deal: "test Deal"),
    Restaurant(name: "Dominos", imageName: "DominosLogo", deal: "test Deal"),
    Restaurant(name: "GondolaPizza", imageName: "GondolaPizzaLogo", deal: "test Deal"),
    Restaurant(name: "LittleCaesars", imageName: "LittleCaesarsLogo", deal: "test Deal"),
    Restaurant(name: "MonaLisa", imageName: "MonaLisaLogo", deal: "test Deal"),
    Restaurant(name: "NiakwaPizza", imageName: "NiakwaPizzaLogo", deal: "test Deal"),
    Restaurant(name: "PapaJohns", imageName: "PapaJohnsLogo", deal: "test Deal"),
    Restaurant(name: "Pasquales", imageName: "PasqualesLogo", deal: "test Deal"),
    Restaurant(name: "PizzaHotline", imageName: "PizzaHotlineLogo", deal: "test Deal"),
    Restaurant(name: "PizzaHut", imageName: "PizzaHutLogo", deal: "test Deal"),
    Restaurant(name: "PizzaPizza", imageName: "PizzaPizzaLogo", deal: "test Deal"),
    Restaurant(name: "PizzaPlace", imageName: "PizzaPlaceLogo", deal: "test Deal"),
    Restaurant(name: "SantaLucia", imageName: "SantaLuciaLogo", deal: "test Deal"),
    Restaurant(name: "DeLucas", imageName: "DeLucasLogo", deal: "test Deal"),

]

var subAndSandwichList = [
    Restaurant(name: "Bernsteins", imageName: "BernsteinsLogo", deal: "test Deal"),
    Restaurant(name: "CalabriaMarket", imageName: "CalabriaMarketLogo", deal: "test Deal"),
    Restaurant(name: "Chachis", imageName: "ChachisLogo", deal: "test Deal"),
    Restaurant(name: "MrSub", imageName: "MrSubLogo", deal: "test Deal"),
    Restaurant(name: "NathanDetroit", imageName: "NathanDetroitLogo", deal: "test Deal"),
    Restaurant(name: "Nicks", imageName: "NicksLogo", deal: "test Deal"),
    Restaurant(name: "SalisburyHouse", imageName: "SalisburyHouseLogo", deal: "test Deal"),
    Restaurant(name: "Stellas", imageName: "StellasLogo", deal: "test Deal"),
    Restaurant(name: "Subway", imageName: "SubwayLogo", deal: "test Deal"),
    Restaurant(name: "TheFixx", imageName: "TheFixxLogo", deal: "test Deal"),
    Restaurant(name: "TheGrove", imageName: "TheGroveLogo", deal: "test Deal"),
]


