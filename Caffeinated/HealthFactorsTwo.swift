//
//  HealthFactorsTwo.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 12/2/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .onTapGesture {
                    let impactMedium = UIImpactFeedbackGenerator(style: .medium)
                                impactMedium.impactOccurred()
                    configuration.isOn.toggle()
                }
            // Declaring this here puts the label after the Image view
            configuration.label
        }
        .font(.custom("Big Caslon", size: 20))
    }
}

struct HealthFactorsTwo: View {
    var coffee: Coffee
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var coffeeSelections = CoffeeSelections()
    @ObservedObject var healthSelections = HealthSelections()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Health factors")
                    .font(.custom("Big Caslon", size: 36))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Are you experiencing any of the following:")
                        .font(.custom("Big Caslon", size: 24))
                    
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 50) {
                            Toggle("anxiety", isOn: $healthSelections.anxietyChecked)
                            Toggle("jitters", isOn: $healthSelections.jittersChecked)
                            Toggle("insomnia", isOn: $healthSelections.insomniaChecked)
                        }
                        
                        VStack(alignment: .leading, spacing: 50) {
                            Toggle("high heart rate", isOn: $healthSelections.highHeartRateChecked)
                            Toggle("tiredness", isOn: $healthSelections.tirednessChecked)
                            Toggle("headache", isOn: $healthSelections.headacheChecked)
                        }
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: Results(coffee: coffee, coffeeSelections: coffeeSelections, healthSelections: healthSelections)) {
                        Text("Results")
                    }
                    .font(.custom("Big Caslon", size: 24))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Spacer()
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

struct HealthFactorsTwo_Previews: PreviewProvider {
    static var previews: some View {
        HealthFactorsTwo(coffee: coffeeData[0])
    }
}
