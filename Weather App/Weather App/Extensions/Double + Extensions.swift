//
//  Double + Extensions.swift
//  Weather App
//
//  Created by Ferhat Geyik on 5.06.2022.
//

import Foundation

extension Double {
    func kelvinToCelcius() -> Double {
        let kelvinZeroInCelcius: Double = 273
        return self - kelvinZeroInCelcius
    }
    
}
