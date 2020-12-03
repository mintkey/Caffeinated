//
//  CoffeeList.swift
//  Caffeinated
//
//  Created by Helen Dempsey on 7/24/20.
//  Copyright © 2020 Helen Dempsey. All rights reserved.
//

import SwiftUI

struct CoffeeList: View {
    @State var isCoffeeDetailActive: Bool = false
    // Workaround initializer for List customization
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "Big Caslon", size: 36)!]
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Big Caslon", size: 24)!]
    }

    var body: some View {
        NavigationView {
            List(coffeeData) { coffee in
                NavigationLink(destination: CoffeeDetail(coffee: coffee)) {
                    CoffeeRow(coffee: coffee)
                }
                .padding()
            }
            .navigationBarTitle(Text("Select a drink"))
            .font(.custom("Big Caslon", size: 18))
        }
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
