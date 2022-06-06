//
//  WeatherDTO.swift
//  Weather App
//
//  Created by Ferhat Geyik on 5.06.2022.
//

import Foundation

// MARK: - WeatherDTO

struct WeatherDTO: Codable {
    
    let main: Main
    let name: String
    let dt: Int
    let weather: [Weather]
    let wind: Wind
    
}

// MARK: - Main

struct Main: Codable {
    let temperature, tempMax, tempMin: Double
    let pressure, humidity: Int
    

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}


// MARK: - Weather

struct Weather: Codable {
    
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}


// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
