//
//  RestaurantStore.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import Foundation
import UIKit



class RestaurantStore {
    private static let url = "https://ptitchevreuil.github.io/test.json"
    
    static func fetchRestaurant(with completion: @escaping (RestaurantAPIModel?) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, _, error) in
                guard let data = data else {
                    print("error: \(String(describing: error?.localizedDescription))")
                    completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                completion(try? decoder.decode(RestaurantAPIModel.self, from: data))
            }
            task.resume()
        }
    
    static func fetchRestaurantImage(imageAddress: String, with completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: imageAddress)!) { (data, _, error) in
            guard let data = data else {
                print("error: \(String(describing: error?.localizedDescription))")
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
        task.resume()
    }
}
