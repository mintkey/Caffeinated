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
    
    enum DrinkSize: String, CaseIterable, Codable, Hashable {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
    
    enum EspressoShots: String, CaseIterable, Codable, Hashable {
        case single = "Single"
        case double = "Double"
        case triple = "Triple"
    }
}

struct CaffeineResults: Codable, Hashable  {
    enum CaffeineAmount: String, CaseIterable, Codable, Hashable {
        case justRight = "👍", tooMuch = "😰", notEnough = "🥱"
        
         var caption: String {
            switch self {
            case .justRight:
                return "Just right!"
            case .tooMuch:
                return "Too much!"
            case .notEnough:
                return "Not enough!"
            }
        }
    }
}
