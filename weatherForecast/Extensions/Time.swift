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