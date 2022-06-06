//
//  WeatherDescription.swift
//  Weather App
//
//  Created by Ferhat Geyik on 6.06.2022.
//

import Foundation
import UIKit


struct WeatherDescription: Codable {
    
    // MARK: - Properties
    var iconName: String
    var description: String
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    enum CodingKeys: String, CodingKey {
        case iconName = "main"
        case description = "description"
    }
}
