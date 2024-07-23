//
//  ForecastModel.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation

struct Forecast: Codable {
    let cityName, countryCode: String?
    let data: [ForecastData]?

    enum CodingKeys: String, CodingKey{
        case cityName = "city_name"
        case countryCode = "country_code"
        case data
    }
    
}

struct ForecastData: Identifiable, Codable {
    let id = UUID().uuidString
    let appMaxTemp, appMinTemp: Double?
    let clouds, cloudsHi, cloudsLow, cloudsMid: Int?
    let datetime: String?
    let dewpt, highTemp, lowTemp: Double?
    let maxDhi: Double?
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

    enum CodingKeys: String, CodingKey {
        case appMaxTemp = "app_max_temp"
        case appMinTemp = "app_min_temp"
        case clouds
        case cloudsHi = "clouds_hi"
        case cloudsLow = "clouds_low"
        case cloudsMid = "clouds_mid"
        case datetime
        case dewpt
        case highTemp = "high_temp"
        case lowTemp = "low_temp"
        case maxDhi = "max_dhi"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case moonPhase = "moon_phase"
        case moonPhaseLunation = "moon_phase_lunation"
        case moonriseTs = "moonrise_ts"
        case moonsetTs = "moonset_ts"
        case ozone
        case pop
        case precip
        case pres
        case rh
        case slp
        case snow
        case snowDepth = "snow_depth"
        case sunriseTs = "sunrise_ts"
        case sunsetTs = "sunset_ts"
        case temp
        case ts
        case uv
        case validDate = "valid_date"
        case vis
        case weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windGustSpd = "wind_gust_spd"
        case windSpd = "wind_spd"
    }
}

struct Weather: Codable {
    let description: String?
    let code: Int?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case description
        case code
        case icon
    }
}

