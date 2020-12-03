//
//  HealthFactors.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 9/1/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

// MARK: - ObservableObject
class HealthSelections: ObservableObject {
    @Published var hoursOfSleepSelected: Health.HoursOfSleep = .average
    @Published var foodEatenPriorSelected: Health.FoodEatenPrior = .yes
    @Published var anxietyChecked: Bool = false
    @Published var jittersChecked: Bool = false
    @Published var insomniaChecked: Bool = false
    @Published var highHeartRateChecked: Bool = false
    @Published var tirednessChecked: Bool = false
    @Published var headacheChecked: Bool = false
}

struct HealthFactorsOne: View {
    var coffee: Coffee
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var coffeeSelections = CoffeeSelections()
    @ObservedObject var healthSelections = HealthSelections()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Health factors")
                    .font(.custom("Big Caslon", size: 36))
                
                Spacer(minLength: 120)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("How much sleep did you get last night?")
                        .font(.custom("Big Caslon", size: 24))
                    
                    Picker("Amount of sleep", selection: $healthSelections.hoursOfSleepSelected) {
                        Text("< 6").tag(Health.HoursOfSleep.lessThanAverage)
                        Text("6 - 8").tag(Health.HoursOfSleep.average)
                        Text("> 8").tag(Health.HoursOfSleep.moreThanAverage)
                    }
                    
                    Spacer()
                        
                    Text("Did you eat < 4 hours ago?")
                        .font(.custom("Big Caslon", size: 24))
                    
                    Picker("Food eaten prior", selection: $healthSelections.foodEatenPriorSelected) {
                        Text("yes").tag(Health.FoodEatenPrior.yes)
                        Text("no").tag(Health.FoodEatenPrior.no)
                    }
                    
                    Spacer()
                    Spacer()
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Spacer()
                    NavigationLink(destination: HealthFactorsTwo(coffee: coffee, coffeeSelections: coffeeSelections)) {
                        Text("Next")
                    }
                    .font(.custom("Big Caslon", size: 24))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Spacer()
                }
                
                Spacer(minLength: 100)
            }
        }
        .padding()
    }
}

struct HealthFactorsOne_Previews: PreviewProvider {
    static var previews: some View {
        HealthFactorsOne(coffee: coffeeData[0])
    }
}
