//
//  RestaurantLabelView.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import SwiftUI

struct RestaurantLabelView: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        Label {
            Text(text)
                .multilineTextAlignment(.leading)
        } icon: {
            Image(imageName)
                .padding()
                .frame(width: 30, height: 30)
                .background(Color.theForkGreen
                                .opacity(0.35)
                                .clipShape(RoundedRectangle(cornerRadius: 8)))
            
        }
    }
}

struct RestaurantLabelView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantLabelView(imageName: "cash", text: "Average Price €27")
            .previewLayout(.sizeThatFits)
    }
}
