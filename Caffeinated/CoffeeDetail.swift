//
//  CoffeeDetail.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? ColorPalette.gossamer : ColorPalette.elfGreen)
        .cornerRadius(7)
            .overlay(configuration.isPressed ? RoundedRectangle(cornerRadius: 7).stroke(ColorPalette.vistaBlue, lineWidth: 1) : RoundedRectangle(cornerRadius: 7).stroke(ColorPalette.elfGreen))
    }
}

class Selections: ObservableObject {
    @Published var drinkSizeSelected: Coffee.DrinkSize = .small
    @Published var espressoShotsSelected: Coffee.EspressoShots = .single
}

struct CoffeeDetail: View {
    var coffee: Coffee
    @ObservedObject var selections = Selections()
    
    var body: some View {
        ZStack {
            ColorPalette.elfGreen
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack {
                    VStack {
                        Text(coffee.name)
                            .font(.custom("FredokaOne-Regular", size: 36))
                            .foregroundColor(ColorPalette.headerMint)
                        Text("\(selections.drinkSizeSelected.rawValue), \(selections.espressoShotsSelected.rawValue) shot")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(ColorPalette.vistaBlue)
                    }
                    Spacer(minLength: 50)


                    VStack(alignment: .leading, spacing: 20) {
                        Text("Drink size")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))

                        HStack(spacing: 40) {
                            Button("small", action: {
                                self.selections.drinkSizeSelected = .small
                            })
                            Button("medium", action: {
                                self.selections.drinkSizeSelected = .medium
                            })
                            Button("large", action: {
                                self.selections.drinkSizeSelected = .large
                            })
                        }

                        Text("Espresso shots")
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        HStack(spacing: 40) {
                            Button("single", action: {
                                self.selections.espressoShotsSelected = .single
                            })
                            Button("double", action: {
                                self.selections.espressoShotsSelected = .double
                            })
                            Button("triple", action: {
                                self.selections.espressoShotsSelected = .triple
                            })
                        }
                        Spacer()
                    }
                    .buttonStyle(CustomButtonStyle())

                    NavigationLink(destination: Results(coffee: coffee, selections: selections)) {
                        Text("Results")
                    }.font(.system(size: 22, weight: .bold, design: .rounded))
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



/**
 * All view controllers with a UINavigationBar and its UIBarButtonItems. This is because a UINavigationController is a lot like a stack where you PUSH (showing new view controller)/POP (dismissing view controller) onto the navigation stack.
 
 Can Setup Navigation Bar
 [UINavigationController]
 - [UIViewController]
 ------ [UIView]
 
 Can't Setup Navigation Bar
 - [UIViewController]
 ---
 
 */
