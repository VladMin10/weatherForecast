//
//  Time.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 24.07.2024.
//

import Foundation
import SwiftUI

func formattedDateAndTime() -> String {
    let dateFormatter = DateFormatter()
    
    // Форматування дня тижня і числа
    dateFormatter.dateFormat = "EEEE d · hh:mm a"
    let formattedDate = dateFormatter.string(from: Date())
    
    // Повертає відформатований рядок
    return formattedDate
}

 func dayOfWeek(from dateString: String?) -> String {
        guard let dateString = dateString else { return "N/A" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" 
        
        guard let date = dateFormatter.date(from: dateString) else { return "N/A" }
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEE"
        return dayFormatter.string(from: date)
    
}
func formatTime(from timestamp: Int?) -> String {
    guard let timestamp = timestamp else { return "N/A" }
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    formatter.timeZone = TimeZone(abbreviation: "Europe/Kyiv")
    return formatter.string(from: date)
}
