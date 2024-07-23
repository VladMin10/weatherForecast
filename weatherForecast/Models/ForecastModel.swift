//
//  ForecastModel.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation

struct Forecast {
    let cityName, countryCode: String?
    let data: [ForecastData]?
    let lat, lon, stateCode, timezone: String?
}

struct ForecastData {
    let appMaxTemp, appMinTemp: Double?
    let clouds, cloudsHi, cloudsLow, cloudsMid: Int?
    let datetime: String?
    let dewpt, highTemp, lowTemp: Double?
    let maxDhi: NSNull?
    let maxTemp, minTemp, moonPhase, moonPhaseLunation: Double?
    let moonriseTs, moonsetTs, ozone, pop: Int?
    let precip: Double?
    let pres, rh, slp, snow: Int?
    let snowDepth, sunriseTs, sunsetTs: Int?
    let temp: Double?
    let ts, uv: Int?
    let validDate: String?
    let vis: Double?
    let weather: Weather?
    let windCdir, windCdirFull: String?
    let windDir: Int?
    let windGustSpd, windSpd: Double?
}


struct Weather {
    let description: String?
    let code: Int?
    let icon: String?
}
