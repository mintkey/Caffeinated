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


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            // Declaring this here puts the label after the Image view
            configuration.label
        }
    }
}

struct HealthFactors: View {
    var coffee: Coffee
    @ObservedObject var coffeeSelections = CoffeeSelections()
    @ObservedObject var healthSelections = HealthSelections()
    
    var body: some View {
        ZStack {
            ColorPalette.elfGreen
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Health factors")
                        .font(.custom("FredokaOne-Regular", size: 36))
                        .foregroundColor(ColorPalette.headerMint)
                    Spacer()
                    
                    Text("How much sleep did you get last night?")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    Picker("Amount of sleep", selection: $healthSelections.hoursOfSleepSelected) {
                        Text("< 6").tag(Health.HoursOfSleep.lessThanAverage)
                        Text("6 - 8").tag(Health.HoursOfSleep.average)
                        Text("> 8").tag(Health.HoursOfSleep.moreThanAverage)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        
                    Text("Did you eat < 4 hours ago?")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    Picker("Food eaten prior", selection: $healthSelections.foodEatenPriorSelected) {
                        Text("yes").tag(Health.FoodEatenPrior.yes)
                        Text("no").tag(Health.FoodEatenPrior.no)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Are you experiencing any of the following:")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Toggle("anxiety", isOn: $healthSelections.anxietyChecked)
                            Toggle("jitters", isOn: $healthSelections.jittersChecked)
                            Toggle("insomnia", isOn: $healthSelections.insomniaChecked)
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Toggle("high heart rate", isOn: $healthSelections.highHeartRateChecked)
                            Toggle("tiredness", isOn: $healthSelections.tirednessChecked)
                            Toggle("headache", isOn: $healthSelections.headacheChecked)
                        }
                        Spacer()
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: Results(coffee: coffee, coffeeSelections: coffeeSelections, healthSelections: healthSelections)) {
                            Text("Results")
                        }
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                
            }
            .font(.system(size: 22, design: .rounded))
            .foregroundColor(ColorPalette.primaryMint)
        }
    }
}

struct HealthFactors_Previews: PreviewProvider {
    static var previews: some View {
        HealthFactors(coffee: coffeeData[0])
    }
}
