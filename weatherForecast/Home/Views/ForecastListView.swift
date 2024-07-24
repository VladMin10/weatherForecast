//
//  ForecastListView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct ForecastListView: View {
    
    @Environment(\.router) var router
    @EnvironmentObject private var vm: HomeViewModel
    private let screen = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3291972876, green: 0.1469685733, blue: 0.8363620639, alpha: 1)), Color(#colorLiteral(red: 0.4434199929, green: 0.2367846966, blue: 0.8589765429, alpha: 1)), Color(#colorLiteral(red: 0.1819976866, green: 0.1189488247, blue: 0.2261904776, alpha: 1)), Color(#colorLiteral(red: 0.007843137719, green: 0.007843137719, blue: 0.007843137719, alpha: 1))]),
                    startPoint: .topTrailing,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        ForEach(vm.forecast?.data ?? [], id: \.validDate) { forecastData in
                            HStack {
                                Text(dayOfWeek(from: forecastData.validDate))
                                    .fontWeight(.medium)
                                    .font(.system(size: 18))
                                    .frame(width: UIScreen.main.bounds.width * 0.35, alignment: .leading)
                                    .padding(.leading, 13)
                                Spacer()
                                
                                if let weatherIcon = forecastData.weather?.icon {
                                    Image(weatherIcon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .frame(width: UIScreen.main.bounds.width * 0.30, alignment: .center)
                                       
                                }
                                
                                Spacer()
                                
                                Text("\(String(format: "%.1f", forecastData.temp ?? 0.0))°C")
                                    .fontWeight(.medium)
                                    .font(.system(size: 18))
                                    .frame(width: UIScreen.main.bounds.width * 0.20, alignment: .trailing)
                                    .padding(.trailing, 6)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .navigationTitle("16-Day Forecast")
            .onAppear {
                print("Forecast Data: \(vm.forecast?.data ?? [])")
            }
        }
    }
    
}

struct ForecastListView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView { _ in
            ForecastListView()
                .environmentObject(dev.homeVM)
        }
    }
}
