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
    @ObservedObject var selections = Selections()
    @State var resultEmoji: CaffeineResults.CaffeineAmount = .justRight
    
    func calculateResults() {
        if (selections.drinkSizeSelected == .small && selections.espressoShotsSelected == .double) {
            resultEmoji = .tooMuch
        } else if (selections.drinkSizeSelected == .small && selections.espressoShotsSelected == .triple) {
            resultEmoji = .tooMuch
        } else if (selections.drinkSizeSelected == .medium && selections.espressoShotsSelected == .triple) {
            resultEmoji = .tooMuch
        } else if (selections.drinkSizeSelected == .large && selections.espressoShotsSelected == .single) {
            resultEmoji = .notEnough
        }
    }
    
    var body: some View {
        ZStack {
            ColorPalette.elfGreen
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack {
                    Text(coffee.name)
                        .font(.custom("FredokaOne-Regular", size: 36))
                        .foregroundColor(ColorPalette.headerMint)
                    Text("\(selections.drinkSizeSelected.rawValue), \(selections.espressoShotsSelected.rawValue) shot")
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
