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
    guard let dateString = dateString else { return "Unknown" }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"  // Переконайся, що це правильний формат
    
    guard let date = dateFormatter.date(from: dateString) else { return "Unknown" }
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "EEEE"
    return dayFormatter.string(from: date)
}
