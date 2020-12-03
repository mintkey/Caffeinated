//
//  Results.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/30/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct Results: View {
    var coffee: Coffee
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var coffeeSelections = CoffeeSelections()
    @ObservedObject var healthSelections = HealthSelections()
    @State var resultEmoji: CaffeineResults.CaffeineAmount = .justRight
    
    func calculateResults() {
        let resultDifference = coffeeSelections.drinkSizeSelected.rawValue - coffeeSelections.espressoShotsSelected.rawValue
        var resultSum = resultDifference + healthSelections.hoursOfSleepSelected.rawValue + healthSelections.foodEatenPriorSelected.rawValue
        
        if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
            resultSum += -2
        } else if (healthSelections.headacheChecked || healthSelections.tirednessChecked) {
            resultSum += 2
        }
    
        if (resultSum == 0) {
            resultEmoji = .justRight
        } else if (resultSum == 1 || resultSum == -1) {
            resultEmoji = .probablyOkay
        } else if (resultSum >= 2) {
            resultEmoji = .notEnough
        } else if (resultSum <= -2) {
            resultEmoji = .tooMuch
        }
    }
    
    var body: some View {
            HStack {
                VStack {
                    Text(coffee.name)
                        .font(.custom("Big Caslon", size: 40))
                    
                    Spacer()
                        
                    .onAppear {
                        self.calculateResults()
                    }
                    
                    Text("\(resultEmoji.rawValue)").font(.system(size: 65))
                        .padding()
                    Text("\(resultEmoji.caption)")
                        .font(.custom("Big Caslon", size: 24))
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(coffee: coffeeData[0])
    }
}
