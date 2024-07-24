//
//  PreviewProvider.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 24.07.2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init(){ }
    
    let homeVM = HomeViewModel()
    let mockForecastData =  ForecastData(
        appMaxTemp: 27.4,
        appMinTemp: 17.1,
        clouds: 58,
        cloudsHi: 55,
        cloudsLow: 56,
        cloudsMid: 36,
        datetime: "2024-07-24",
        dewpt: 16.5,
        highTemp: 27.1,
        lowTemp: 16.3,
        maxDhi: nil,
        maxTemp: 27.1,
        minTemp: 17.1,
        moonPhase: 0.8,
        moonPhaseLunation: 0.65,
        moonriseTs: 1721851368,
        moonsetTs: 1721806921,
        ozone: 336,
        pop: 60,
        precip: 4.354687,
        pres: 975,
        rh: 77,
        slp: 1012,
        snow: 0,
        snowDepth: 0,
        sunriseTs: 1721788953,
        sunsetTs: 1721844982,
        temp: 21.1,
        ts: 1721768460,
        uv: 8,
        validDate: "2024-07-24",
        vis: 24,
        weather: Weather(description: "Дощ", code: 500, icon: "r01d"),
        windCdir: "З",
        windCdirFull: "захід",
        windDir: 281,
        windGustSpd: 3,
        windSpd: 1.1
    )
    let mockForecast = Forecast(
        cityName: "Lviv",
        countryCode: "UA",
        data: [
            ForecastData(
                appMaxTemp: 27.4,
                appMinTemp: 17.1,
                clouds: 58,
                cloudsHi: 55,
                cloudsLow: 56,
                cloudsMid: 36,
                datetime: "2024-07-24",
                dewpt: 16.5,
                highTemp: 27.1,
                lowTemp: 16.3,
                maxDhi: nil,
                maxTemp: 27.1,
                minTemp: 17.1,
                moonPhase: 0.8,
                moonPhaseLunation: 0.65,
                moonriseTs: 1721851368,
                moonsetTs: 1721806921,
                ozone: 336,
                pop: 60,
                precip: 4.354687,
                pres: 975,
                rh: 77,
                slp: 1012,
                snow: 0,
                snowDepth: 0,
                sunriseTs: 1721788953,
                sunsetTs: 1721844982,
                temp: 21.1,
                ts: 1721768460,
                uv: 8,
                validDate: "2024-07-24",
                vis: 24,
                weather: Weather(description: "Дощ", code: 500, icon: "r01d"),
                windCdir: "З",
                windCdirFull: "захід",
                windDir: 281,
                windGustSpd: 3,
                windSpd: 1.1
            ),
            ForecastData(
                appMaxTemp: 26.3,
                appMinTemp: 16.0,
                clouds: 20,
                cloudsHi: 15,
                cloudsLow: 18,
                cloudsMid: 10,
                datetime: "2024-07-25",
                dewpt: 15.2,
                highTemp: 26.0,
                lowTemp: 15.8,
                maxDhi: nil,
                maxTemp: 26.0,
                minTemp: 16.0,
                moonPhase: 0.6,
                moonPhaseLunation: 0.5,
                moonriseTs: 1721937768,
                moonsetTs: 1721893321,
                ozone: 340,
                pop: 30,
                precip: 1.354687,
                pres: 980,
                rh: 75,
                slp: 1015,
                snow: 0,
                snowDepth: 0,
                sunriseTs: 1721875353,
                sunsetTs: 1721931382,
                temp: 20.5,
                ts: 1721854860,
                uv: 7,
                validDate: "2024-07-25",
                vis: 22,
                weather: Weather(description: "Ясно", code: 800, icon: "c01d"),
                windCdir: "ПнЗ",
                windCdirFull: "північно-захід",
                windDir: 300,
                windGustSpd: 2.8,
                windSpd: 1.0
            )
        ]
    )
}
