//
//  CoffeeDetail.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct CoffeeDetail: View {
    var coffee: Coffee

    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline, spacing: 20) {
                Text(coffee.name)
                    .font(.custom("FredokaOne-Regular", size: 36))
                    .foregroundColor(ColorPalette.headerMint)
                Text("\(coffee.drinkSize.rawValue) oz, shot")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
            }
            .padding()
            
            Text("Drink size")
                .font(.system(size: 32, weight: .semibold, design: .rounded))
        }
        .font(.system(.body, design: .rounded))
        .foregroundColor(ColorPalette.primaryMint)
        .navigationBarTitle(Text(coffee.name), displayMode: .inline)
        .background(ColorPalette.elfGreen)
    }
}

struct CoffeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetail(coffee: coffeeData[0])
    }
}
