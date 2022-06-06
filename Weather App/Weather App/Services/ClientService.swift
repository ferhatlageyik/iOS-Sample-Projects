//
//  ClientService.swift
//  Weather App
//
//  Created by Ferhat Geyik on 4.06.2022.
//

import Foundation

class ClientNetworkService {

    private let searchCityEndpoint = "weather?q="

    
    static let instance = ClientNetworkService()
    
    private let networkService = NetworkService.instance
    
    func searchCity( cityName: String,
                    completion: @escaping (WeatherDTO?, Error?) -> Void) {
        let urlString = searchCityEndpoint + cityName
        networkService.get(from: urlString, completion: completion)
    }
    
}
