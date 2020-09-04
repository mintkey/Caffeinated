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

// TODO: Make custom styling remain on selection, not just on press
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? ColorPalette.gossamer : ColorPalette.elfGreen)
        .cornerRadius(7)
            .overlay(configuration.isPressed ? RoundedRectangle(cornerRadius: 7).stroke(ColorPalette.vistaBlue, lineWidth: 1) : RoundedRectangle(cornerRadius: 7).stroke(ColorPalette.elfGreen))
    }
}

struct CoffeeDetail: View {
    var coffee: Coffee
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
                    Text("\(coffeeSelections.drinkSizeSelected.rawValue), \(coffeeSelections.espressoShotsSelected.rawValue) shot")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(ColorPalette.vistaBlue)
                    Spacer(minLength: 50)

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Drink size")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                        
                        // FIXME: Generate Buttons algorithmically
                        HStack(spacing: 40) {
                            Button("small", action: {
                                self.coffeeSelections.drinkSizeSelected = .small
                            })
                            Button("medium", action: {
                                self.coffeeSelections.drinkSizeSelected = .medium
                            })
                            Button("large", action: {
                                self.coffeeSelections.drinkSizeSelected = .large
                            })
                        }
                        

                        Text("Espresso shots")
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        
                        // FIXME: Generate Buttons algorithmically
                        HStack(spacing: 40) {
                            Button("single", action: {
                                self.coffeeSelections.espressoShotsSelected = .single
                            })
                            Button("double", action: {
                                self.coffeeSelections.espressoShotsSelected = .double
                            })
                            Button("triple", action: {
                                self.coffeeSelections.espressoShotsSelected = .triple
                            })
                        }
                        Spacer()
                    }
                    .buttonStyle(CustomButtonStyle())

                    // Any referenced variables from current the view must be declared as parameters in the destination view
                    NavigationLink(destination: HealthFactors(coffee: coffee, coffeeSelections: coffeeSelections)) {
                        Text("Next")
                    }.font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.leading, 115)
                    Spacer(minLength: 100)
                }
            }
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
