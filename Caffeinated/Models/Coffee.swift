//
//  Coffee.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

/**
 README: All integer values assigned to enum cases are to help calculate the results.
 See also: calculateResults() in Results.swift
 
 Coffee's enums DrinkSize and EspressoShots have values directly correlating to the size and number of shots.
 
 Health's enums' values are assigned based on whether the option means the user needs more or less caffeine, e.g. if the user got less than an average amount of sleep, the user may need more caffeine.
 
 Positive values attribute to not enough, negative values attribute to too much, and 0 (or close to 0) means the amount of caffeine is just right/good enough.
 */

import SwiftUI

struct Coffee: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var drinkSize: DrinkSize
    var espressoShots: EspressoShots
    
    enum DrinkSize: Int, CaseIterable, Codable, Hashable, Identifiable {
        case small = 1
        case medium = 2
        case large = 3
        
        var id: Int { self.rawValue }
    }
    
    enum EspressoShots: Int, CaseIterable, Codable, Hashable, Identifiable {
        case single = 1
        case double = 2
        case triple = 3
        
        var id: Int { self.rawValue }
    }
}

struct Health: Hashable, Codable {
    var hoursOfSleep: HoursOfSleep
    var foodEatenPrior: FoodEatenPrior
    
    enum HoursOfSleep: Int, CaseIterable, Codable, Hashable {
        case lessThanAverage = 1
        case average = 0
        case moreThanAverage = -1
    }
    
    enum FoodEatenPrior: Int, CaseIterable, Codable, Hashable {
        case yes = 0
        case no = -1
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
                return "Probably OK."
            }
        }
    }
}
