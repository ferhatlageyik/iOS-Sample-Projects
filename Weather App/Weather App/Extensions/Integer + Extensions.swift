//
//  Integer + Extensions.swift
//  Weather App
//
//  Created by Ferhat Geyik on 6.06.2022.
//

import Foundation


extension Int {
    
    func convertDateIntervalToHourString() -> String {
        
        let day: String

        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let dateFormatterForDay = DateFormatter()
        dateFormatterForDay.dateFormat = "d MMM, EEEE"
        dateFormatterForDay.locale = Locale(identifier: "en_EN")
        
        
        day = dateFormatterForDay.string(from: date)
  
        return day
    }
}
