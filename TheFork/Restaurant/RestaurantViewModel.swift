//
//  RestaurantViewModel.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import Foundation
import MapKit

class RestaurantViewModel: ObservableObject {
    @Published var didFetchRestaurant = false
    @Published var restaurantModel: RestaurantModel = RestaurantModel()
    @Published var restaurantLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    public func loadRestaurant() {
        RestaurantStore.fetchRestaurant { restaurant in
            if let restaurant = restaurant {
                for url in restaurant.pics_diaporama {
                    RestaurantStore.fetchRestaurantImage(imageAddress: url, with: { image in
                        guard let image = image else { return }
                        DispatchQueue.main.async {
                            self.restaurantModel.images.append(image)
                        }
                    })
                }
                DispatchQueue.main.async {
                    print("fetched restaurant")
                    self.didFetchRestaurant.toggle()
                    self.restaurantModel = restaurant.restaurantModel
                    self.restaurantLocation = MKCoordinateRegion(center: restaurant.restaurantModel.coords, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                }
            }
        }
    }
}
