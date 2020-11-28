//
//  RestaurantView.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import SwiftUI

struct RestaurantView: View {
    @StateObject private var restaurantViewModel = RestaurantViewModel()
    
    var body: some View {
        VStack {
            if restaurantViewModel.didFetchRestaurant {
                ScrollView(.vertical, showsIndicators: false) {
                    HeaderGalleryView(images: restaurantViewModel.restaurantModel.images)
                    VStack(alignment: .leading, spacing: 24) {
                        Text(restaurantViewModel.restaurantModel.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        InformationView(address: restaurantViewModel.restaurantModel.address, city: restaurantViewModel.restaurantModel.city, zipcode: restaurantViewModel.restaurantModel.zipcode, speciality: restaurantViewModel.restaurantModel.speciality, currency: restaurantViewModel.restaurantModel.currency, price: restaurantViewModel.restaurantModel.card_price)
                        ReviewsView(tf_avg_rate: restaurantViewModel.restaurantModel.avg_rate, tf_rate_count: restaurantViewModel.restaurantModel.rate_count, ta_avg_rate: restaurantViewModel.restaurantModel.tripadvisor_avg_rate, ta_rate_count: restaurantViewModel.restaurantModel.tripadvisor_rate_count)
                    } // vstack
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                    AddressView(location: $restaurantViewModel.restaurantLocation, address: restaurantViewModel.restaurantModel.coords)
                } // scroll
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.top)
                .overlay(
                    VStack {
                        Button {
                            print("book a table: button pressed")
                        } label: {
                            Text("Book a table")
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.theForkGreen)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 16)
                        )
                        Spacer()
                            .frame(height: 20)
                    }
                    , alignment: .bottom)
            } else {
                ProgressView("Fetching restaurant data")
            }
        }
        .onAppear(perform: restaurantViewModel.loadRestaurant)
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView()
    }
}
