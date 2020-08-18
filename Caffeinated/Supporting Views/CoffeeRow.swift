//
//  CoffeeRow.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 8/16/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct CoffeeRow: View {
    var coffee: Coffee

    var body: some View {
        HStack {
            Text(coffee.name)
            .padding()
            Spacer()
        }
    }
}

struct CoffeeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoffeeRow(coffee: coffeeData[0])
            CoffeeRow(coffee: coffeeData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
