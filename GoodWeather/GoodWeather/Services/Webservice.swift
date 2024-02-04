//
//  Webservice.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 04/12/23.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                print("Network error occurred")
                completion(nil)
            }
        }.resume()
    }
}
