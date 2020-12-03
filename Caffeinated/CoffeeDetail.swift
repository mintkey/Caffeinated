//
//  CoffeeDetail.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

// MARK: - ObservableObject
// CoffeeSelections class is typed ObservableObject so that mutated variables can be accessed across multiple views
class CoffeeSelections: ObservableObject {
    @Published var drinkSizeSelected: Coffee.DrinkSize = .small
    @Published var espressoShotsSelected: Coffee.EspressoShots = .single
}

struct CoffeeDetail: View {
    var coffee: Coffee
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var coffeeSelections = CoffeeSelections()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(coffee.name)
                    .font(.custom("Big Caslon", size: 36))
                Text("What kind of \(coffee.name.lowercased()) are you having today?")
                    .font(.custom("Big Caslon", size: 20))
                
                Spacer(minLength: 120)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Drink size")
                        .font(.custom("Big Caslon", size: 32))
                    Picker("Drink size", selection: $coffeeSelections.drinkSizeSelected) {
                        Text("small").tag(Coffee.DrinkSize.small)
                        Text("medium").tag(Coffee.DrinkSize.medium)
                        Text("large").tag(Coffee.DrinkSize.large)
                    }
                    
                    Spacer()

                    Text("Espresso shots")
                        .font(.custom("Big Caslon", size: 32))
                    Picker("Espresso shots", selection: $coffeeSelections.espressoShotsSelected) {
                        Text("single").tag(Coffee.EspressoShots.single)
                        Text("double").tag(Coffee.EspressoShots.double)
                        Text("triple").tag(Coffee.EspressoShots.triple)
                    }
                    
                    Spacer()
                    Spacer()
                }
                .pickerStyle(SegmentedPickerStyle())

                // Any referenced variables from current the view must be declared as parameters in the destination view
                HStack {
                    Spacer()
                    NavigationLink(destination: HealthFactorsOne(coffee: coffee, coffeeSelections: coffeeSelections)) {
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

struct CoffeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetail(coffee: coffeeData[0])
    }
}
