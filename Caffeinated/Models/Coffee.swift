//
//  Coffee.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct Coffee: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var drinkSize: DrinkSize
    var espressoShots: EspressoShots
    
    enum DrinkSize: Int, CaseIterable, Codable, Hashable {
        case small = 8
        case medium = 16
        case large = 32
    }
    
    enum EspressoShots: Int, CaseIterable, Codable, Hashable {
        case single = 1
        case double = 2
    }
}
