//
//  RequestManager.swift
//  Weather App
//
//  Created by Ferhat Geyik on 4.06.2022.
//

import Foundation


class NetworkService {
    private let apiKey = "&appid=e86d7d6f094bfe2ea2cb21a9467985c9"
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static let instance = NetworkService()
    
    func get<T: Codable>(from urlString: String, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string :baseURL + urlString + apiKey )  else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
