//
//  Banned.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-06-14.
//

import Foundation
import SwiftUI

class Banned: Codable {
    var bannedId: String
    var deviceId: String
    
    init(bannedId: String, deviceId: String) {
        self.bannedId = bannedId
        self.deviceId = deviceId
    }
}
