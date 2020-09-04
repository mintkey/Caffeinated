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
    @Published var foodEatenPriorSelected: Health.FoodEatenPrior = .unsure
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
                    
                    // FIXME: Generate Buttons algorithmically
                    HStack(spacing: 60) {
                        Button("< 6", action: {
                            self.healthSelections.hoursOfSleepSelected = .lessThanAverage
                        })
                        Button("6 - 8", action: {
                            self.healthSelections.hoursOfSleepSelected = .average
                        })
                        Button("> 8", action: {
                            self.healthSelections.hoursOfSleepSelected = .moreThanAverage
                        })
                    }.buttonStyle(CustomButtonStyle())
                        
                    // FIXME: Generate Buttons algorithmically
                    Text("Did you eat < 4 hours ago?")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    
                    HStack(spacing: 70) {
                        Button("yes", action: {
                            self.healthSelections.foodEatenPriorSelected = .yes
                        })
                        Button("no", action: {
                            self.healthSelections.foodEatenPriorSelected = .no
                        })
                        Button("unsure", action: {
                            self.healthSelections.foodEatenPriorSelected = .unsure
                        })
                    }.buttonStyle(CustomButtonStyle())
                    
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
                    
                    NavigationLink(destination: Results(coffee: coffee, coffeeSelections: coffeeSelections, healthSelections: healthSelections)) {
                        Text("Results")
                    }.font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding(.leading, 125)
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
