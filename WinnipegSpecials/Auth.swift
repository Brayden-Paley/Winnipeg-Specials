//
//  Auth.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-05-16.
//

import Foundation
import SwiftUI

class Auth: Codable {
    var authId: String
    var deviceId: String
    var dealId: String
    
    init(authId: String, deviceId: String, dealId: String){
        self.authId = authId
        self.deviceId = deviceId
        self.dealId = dealId
    }
}


