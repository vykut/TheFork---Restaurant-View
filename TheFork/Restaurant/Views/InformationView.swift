//
//  InformationView.swift
//  TheFork
//
//  Created by Victor Socaciu on 28.11.2020.
//

import SwiftUI

struct InformationView: View {
    
    let address: String
    let city: String
    let zipcode: String
    let speciality: String
    let currency: Currency
    let price: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            RestaurantLabelView(imageName: "location", text: "\(address), \(city) \(zipcode)")
            RestaurantLabelView(imageName: "food", text: speciality)
            RestaurantLabelView(imageName: "cash", text: "Average price \(currency.rawValue)\(price)")
        } // vstack
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(address: "Champs Elysees", city: "Paris", zipcode: "12345", speciality: "French Cuisine", currency: .EUR, price: 42)
            .previewLayout(.sizeThatFits)
    }
}
