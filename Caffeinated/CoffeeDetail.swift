//
//  CoffeeDetail.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

// Set custom colors of SegmentedPicker using UISegmentedControl
class CustomSegmentedPicker {
    init() {
        let gossamer = UIColor(displayP3Red: 0.204, green: 0.565, blue: 0.475, alpha: 1.0)
        let primaryMint = UIColor(displayP3Red: 0.827, green: 0.933, blue: 0.886, alpha: 1.0)
        let vistaBlue = UIColor(displayP3Red: 0.612, green: 0.816, blue: 0.722, alpha: 1.0)
        UISegmentedControl.appearance().selectedSegmentTintColor = gossamer
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: primaryMint], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: vistaBlue], for: .normal)
    }
}

// MARK: - ObservableObject
// CoffeeSelections class is typed ObservableObject so that mutated variables can be accessed across multiple views
class CoffeeSelections: ObservableObject {
    @Published var drinkSizeSelected: Coffee.DrinkSize = .small
    @Published var espressoShotsSelected: Coffee.EspressoShots = .single
}

struct CoffeeDetail: View {
    var coffee: Coffee
    let customSegmentedPicker = CustomSegmentedPicker()
    @ObservedObject var coffeeSelections = CoffeeSelections()
    
    var body: some View {
        ZStack {
            // Applies background color to entire view
            ColorPalette.elfGreen
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack(alignment: .leading) {
                    Text(coffee.name)
                        .font(.custom("FredokaOne-Regular", size: 40))
                            .foregroundColor(ColorPalette.headerMint)
                    Text("What kind of \(coffee.name.lowercased()) are you having today?")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(ColorPalette.vistaBlue)
                    Spacer(minLength: 50)

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Drink size")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                        Picker("Drink size", selection: $coffeeSelections.drinkSizeSelected) {
                            Text("small").tag(Coffee.DrinkSize.small)
                            Text("medium").tag(Coffee.DrinkSize.medium)
                            Text("large").tag(Coffee.DrinkSize.large)
                        }

                        Text("Espresso shots")
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        Picker("Espresso shots", selection: $coffeeSelections.espressoShotsSelected) {
                            Text("single").tag(Coffee.EspressoShots.single)
                            Text("double").tag(Coffee.EspressoShots.double)
                            Text("triple").tag(Coffee.EspressoShots.triple)
                        }
                        Spacer()
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    // Any referenced variables from current the view must be declared as parameters in the destination view
                    HStack {
                        Spacer()
                        NavigationLink(destination: HealthFactors(coffee: coffee, coffeeSelections: coffeeSelections)) {
                            Text("Next")
                        }.font(.system(size: 22, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    Spacer(minLength: 100)
                }
            }
            .padding()
            .font(.system(.body, design: .rounded))
            .foregroundColor(ColorPalette.primaryMint)
        }
        
    }
}

struct CoffeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetail(coffee: coffeeData[0])
    }
}
