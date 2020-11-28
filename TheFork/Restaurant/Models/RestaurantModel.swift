//
//  RestaurantModel.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import Foundation
import MapKit
import UIKit

public struct RestaurantAPIModel: Codable {
    let id: Int
    let name: String
    let gps_lat: Double
    let gps_long: Double
    let address: String
    let city: String
    let zipcode: String
    let currency_code: String
    let card_price: Int
    let tripadvisor_avg_rate: Double
    let tripadvisor_rate_count: Int
    let avg_rate: Double
    let rate_count: Int
    let speciality: String
    let url: String
    let pics_diaporama: [String]
    
    public var restaurantModel: RestaurantModel {
        RestaurantModel(id: id, name: name, coords: CLLocationCoordinate2D(latitude: gps_lat, longitude: gps_long), address: address, city: city, zipcode: zipcode, currency: Currency(rawValue: currency_code) ?? .EUR, card_price: card_price, tripadvisor_avg_rate: tripadvisor_avg_rate, tripadvisor_rate_count: tripadvisor_rate_count, avg_rate: avg_rate, rate_count: rate_count, speciality: speciality, url: url)
    }
}

public struct RestaurantModel {
    let id: Int
    let name: String
    let coords: CLLocationCoordinate2D
    let address: String
    let city: String
    let zipcode: String
    let currency: Currency
    let card_price: Int
    let tripadvisor_avg_rate: Double
    let tripadvisor_rate_count: Int
    let avg_rate: Double
    let rate_count: Int
    let speciality: String
    let url: String
    var images: [UIImage] = [UIImage]()
    
    init() {
        id = 0
        name = ""
        coords = CLLocationCoordinate2D()
        address = ""
        city = ""
        zipcode = ""
        currency = Currency.EUR
        card_price = 0
        tripadvisor_avg_rate = 0
        tripadvisor_rate_count = 0
        avg_rate = 0
        rate_count = 0
        speciality = ""
        url = ""
    }
    
    internal init(id: Int, name: String, coords: CLLocationCoordinate2D, address: String, city: String, zipcode: String, currency: Currency, card_price: Int, tripadvisor_avg_rate: Double, tripadvisor_rate_count: Int, avg_rate: Double, rate_count: Int, speciality: String, url: String, images: [UIImage] = [UIImage]()) {
        self.id = id
        self.name = name
        self.coords = coords
        self.address = address
        self.city = city
        self.zipcode = zipcode
        self.currency = currency
        self.card_price = card_price
        self.tripadvisor_avg_rate = tripadvisor_avg_rate
        self.tripadvisor_rate_count = tripadvisor_rate_count
        self.avg_rate = avg_rate
        self.rate_count = rate_count
        self.speciality = speciality
        self.url = url
        self.images = images
    }
}
