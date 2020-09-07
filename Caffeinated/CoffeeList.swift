//
//  CoffeeList.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 7/24/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

/// Custom color asset variables
struct ColorPalette {
    static let elfGreen = Color("elfGreen")
    static let headerMint = Color("headerMint")
    static let primaryMint = Color("primaryMint")
    static let vistaBlue = Color("vistaBlue")
    static let gossamer = Color("gossamer")
}

struct CoffeeList: View {
    /// Workaround initializer for List customization
    init() {
        let elfGreen = UIColor(displayP3Red: 0.09020, green: 0.53333, blue: 0.41961, alpha: 1.0)
        let headerMint = UIColor(displayP3Red: 0.92549, green: 0.99216, blue: 0.96078, alpha: 1.0)
        
        UITableView.appearance().backgroundColor = elfGreen
        UITableViewCell.appearance().backgroundColor = elfGreen
        
        UINavigationBar.appearance().backgroundColor = elfGreen
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "FredokaOne-Regular", size: 36)!, .foregroundColor: headerMint]
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "FredokaOne-Regular", size: 24)!]
    }
    
    var body: some View {
        NavigationView {
            List(coffeeData) { coffee in
                NavigationLink(destination: CoffeeDetail(coffee: coffee)) {
                    CoffeeRow(coffee: coffee)
                }
            }
            .navigationBarTitle(Text("Drink selection"))
            .font(.system(.body, design: .rounded))
            .foregroundColor(ColorPalette.primaryMint)
        }
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
