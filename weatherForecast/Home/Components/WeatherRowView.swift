//
//  DetailsListView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI

struct WeatherRowView: View {
    let forecastData: ForecastData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sun.horizon.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 28))
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sunrise")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(formatTime(from: forecastData.sunriseTs))")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                }
                
               
                
                Spacer()
                Image(systemName: "cloud.moon.fill")
                    .foregroundColor(Color.theme.purple)
                    .font(.system(size: 28))
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sunset")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(formatTime(from: forecastData.sunsetTs))")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                }
            }
            .padding(.bottom, 4)
            Divider()
            HStack {
                VStack(alignment: .leading){
                    Text("Humidity")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(forecastData.rh ?? 0)%")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Wind")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(forecastData.windCdir ?? "N/A")")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                }
            }
            .padding(.bottom, 4)
            Divider()
            HStack {
                VStack(alignment: .leading){
                    Text("Min Temp")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(String(format: "%.1f", forecastData.appMinTemp ?? 0.0))°C")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                }
                
                Spacer()
                VStack(alignment: .leading){
                    Text("Max Temp")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .fontDesign(.rounded)
                    Text("\(String(format: "%.1f", forecastData.appMaxTemp ?? 0.0))°C")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .foregroundColor(Color.theme.accent)
                        .fontDesign(.rounded)
                         
                }
                
            }
        }
        .padding()
    }
    
    private func formatTime(from timestamp: Int?) -> String {
        guard let timestamp = timestamp else { return "N/A" }
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(abbreviation: "Europe/Kyiv")
        return formatter.string(from: date)
    }
}

#Preview {
    WeatherRowView(forecastData: ForecastData(
                appMaxTemp: 20.0,
                appMinTemp: 10.0,
                clouds: 10,
                cloudsHi: 5,
                cloudsLow: 0,
                cloudsMid: 5,
                datetime: "2024-07-23",
                dewpt: 15.0,
                highTemp: 22.0,
                lowTemp: 12.0,
                maxDhi: 18.0,
                maxTemp: 22.0,
                minTemp: 12.0,
                moonPhase: 0.5,
                moonPhaseLunation: 0.5,
                moonriseTs: 1721702475,
                moonsetTs: 1721742475,
                ozone: 300,
                pop: 10,
                precip: 0.0,
                pres: 1015,
                rh: 65,
                slp: 1015,
                snow: 0,
                snowDepth: 0,
                sunriseTs: 1721696475,
                sunsetTs: 1721738475,
                temp: 18.0,
                ts: 1721696475,
                uv: 5,
                validDate: "2024-07-23",
                vis: 10.0,
                weather: Weather(description: "Clear", code: 800, icon: "01d"),
                windCdir: "N",
                windCdirFull: "North",
                windDir: 0,
                windGustSpd: 5.0,
                windSpd: 3.0
            ))
    .preferredColorScheme(.dark)
}
