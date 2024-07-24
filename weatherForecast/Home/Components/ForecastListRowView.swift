//
//  ForecastListRowView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 24.07.2024.
//

import SwiftUI

struct ForecastListRowView: View {
    
    let forecastData: ForecastData
       
       var body: some View {
           ZStack{
               Color.clear.ignoresSafeArea()
               
               HStack(spacing: 16) {
                   Text(dayOfWeek(from: forecastData.validDate))
                       .fontWeight(.medium)
                       .font(.system(size: 18))
                       .frame(width: UIScreen.main.bounds.width * 0.15, alignment: .leading)
                       .padding(.leading, 40)
                   
                   
                   HStack(spacing : 3){
                       if let weatherIcon = forecastData.weather?.icon {
                           Image(weatherIcon)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 40, height: 40)
                       }
                       if let weatherDescription = forecastData.weather?.description{
                           Text(weatherDescription.capitalized)
                       }
                   }
                   .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .center)
                   
                   
                   
                   Text("\(String(format: "%.1f", forecastData.temp ?? 0.0))°C")
                       .fontWeight(.medium)
                       .font(.system(size: 36))
                       .fontDesign(.serif)
                       .frame(width: UIScreen.main.bounds.width * 0.30, alignment: .leading)
                       //.padding(.trailing, 20)
               }
               .padding(.vertical, 8)
           }
           

           
       }
}

struct ForecastListRowView_Previews : PreviewProvider {
    static var previews: some View{
        ForecastListRowView(forecastData: dev.mockForecastData)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        
    }
}
