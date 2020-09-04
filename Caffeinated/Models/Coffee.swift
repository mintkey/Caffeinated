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

struct Health: Hashable, Codable {
    var hoursOfSleep: HoursOfSleep
    var foodEatenPrior: FoodEatenPrior
    
    enum HoursOfSleep: String, CaseIterable, Codable, Hashable {
        case lessThanAverage = "< 6"
        case average = "6 - 8"
        case moreThanAverage = "> 8"
    }
    
    enum FoodEatenPrior: String, CaseIterable, Codable, Hashable {
        case yes = "Yes"
        case no = "No"
        case unsure = "Unsure"
    }
}

struct CaffeineResults: Hashable, Codable  {
    enum CaffeineAmount: String, CaseIterable, Hashable, Codable {
        case justRight = "👍"
        case tooMuch = "😰"
        case notEnough = "🥱"
        case probablyOkay = "✅"
        
         var caption: String {
            switch self {
            case .justRight:
                return "Just right!"
            case .tooMuch:
                return "Too much!"
            case .notEnough:
                return "Not enough!"
            case .probablyOkay:
                return "Probably okay. If symptoms are recurring, then you should adjust your amount of espresso."
            }
        }
    }
}
