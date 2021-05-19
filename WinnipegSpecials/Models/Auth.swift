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
    var upvoted: Bool
    
    init(authId: String, deviceId: String, dealId: String, upvoted: Bool){
        self.authId = authId
        self.deviceId = deviceId
        self.dealId = dealId
        self.upvoted = upvoted
    }
}


