//
//  ContentView.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RestaurantView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
