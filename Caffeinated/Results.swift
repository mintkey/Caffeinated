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
    @ObservedObject var coffeeSelections = CoffeeSelections()
    @ObservedObject var healthSelections = HealthSelections()
    @State var resultEmoji: CaffeineResults.CaffeineAmount = .justRight
    
    // TODO: Refactor this entire function, readability is nearly nonexistent right now
    func calculateResults() {
        if (coffeeSelections.drinkSizeSelected == .small) {
            if (coffeeSelections.espressoShotsSelected == .single) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .probablyOkay
                    } else {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.tirednessChecked || healthSelections.headacheChecked) {
                        resultEmoji = .notEnough
                    } else {
                        resultEmoji = .justRight
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .double) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .probablyOkay
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .notEnough
                    } else {
                        resultEmoji = .justRight
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .triple) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .tooMuch
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .probablyOkay
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .notEnough
                    } else {
                        resultEmoji = .justRight
                    }
                }
            }
        } else if (coffeeSelections.drinkSizeSelected == .medium) {
            if (coffeeSelections.espressoShotsSelected == .single) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .probablyOkay
                    } else {
                        resultEmoji = .notEnough
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .notEnough
                    } else {
                        resultEmoji = .justRight
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .double) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .probablyOkay
                    } else {
                        resultEmoji = .justRight
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.tirednessChecked || healthSelections.headacheChecked) {
                        resultEmoji = .probablyOkay
                    } else {
                        resultEmoji = .justRight
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .triple) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .probablyOkay
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .justRight
                    }
               }
            }
        } else if (coffeeSelections.drinkSizeSelected == .large) {
            if (coffeeSelections.espressoShotsSelected == .single) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .justRight
                    } else {
                        resultEmoji = .notEnough
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .notEnough
                    } else {
                        resultEmoji = .probablyOkay
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .double) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .probablyOkay
                    } else {
                        resultEmoji = .justRight
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .justRight
                    }
                }
            } else if (coffeeSelections.espressoShotsSelected == .triple) {
                if (healthSelections.hoursOfSleepSelected == .lessThanAverage) {
                    if (healthSelections.foodEatenPriorSelected == .no) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .justRight
                    }

                    if (healthSelections.tirednessChecked) {
                        resultEmoji = .notEnough
                    }
                } else if (healthSelections.hoursOfSleepSelected == .average || healthSelections.hoursOfSleepSelected == .moreThanAverage) {
                    if (healthSelections.anxietyChecked || healthSelections.jittersChecked || healthSelections.insomniaChecked || healthSelections.highHeartRateChecked) {
                        resultEmoji = .tooMuch
                    } else if (healthSelections.headacheChecked) {
                        resultEmoji = .tooMuch
                    } else {
                        resultEmoji = .justRight
                    }
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            ColorPalette.elfGreen
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack {
                    Text(coffee.name)
                        .font(.custom("FredokaOne-Regular", size: 40))
                        .foregroundColor(ColorPalette.headerMint)
                    Text("\(coffeeSelections.drinkSizeSelected.rawValue), \(coffeeSelections.espressoShotsSelected.rawValue) shot")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(ColorPalette.vistaBlue)
                    Spacer()
                        
                    .onAppear {
                        self.calculateResults()
                    }
                    Text("\(resultEmoji.rawValue)").font(.system(size: 65))
                        .padding()
                    Text("\(resultEmoji.caption)")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                    Spacer()
                }
                .font(.system(.body, design: .rounded))
                .foregroundColor(ColorPalette.primaryMint)
            }
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(coffee: coffeeData[0])
    }
}
