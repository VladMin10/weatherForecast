//
//  ContentView.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//
import SwiftUI
import SwiftfulRouting

struct HomeView: View {
    
    @Environment(\.router) var router
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showForecastList: Bool = false
    @State private var showCitySearch: Bool = false
    
    private let screen = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8541352153, green: 0.5594686866, blue: 0.1578827798, alpha: 1)), Color(#colorLiteral(red: 0.8541352153, green: 0.5594686866, blue: 0.1578827798, alpha: 1)), Color(#colorLiteral(red: 0.3477689028, green: 0.308401376, blue: 0.4028912783, alpha: 1)), Color(#colorLiteral(red: 0.2801563144, green: 0.2702560127, blue: 0.4142053723, alpha: 1)), Color(#colorLiteral(red: 0.03830987588, green: 0.0432978794, blue: 0.07290751487, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                header
                    .padding(.leading, 25)
                    .padding(.trailing, 10)
                temperature
                    .foregroundColor(Color.theme.accent)
                    .fontDesign(.rounded)
                if let firstForecast = vm.forecast?.data?.first {
                    WeatherRowView(forecastData: firstForecast)
                } else {
                    Text("No forecasts available.")
                        .foregroundColor(.white)
                }
            }
            .onAppear {
                vm.requestLocation()
            }
        }
        .environmentObject(vm)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView { _ in
            HomeView()
        }
        .environmentObject(HomeViewModel())
        .preferredColorScheme(.dark)
    }
}

extension HomeView {
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 2) {
                    Text(vm.forecast?.cityName ?? "City")
                    Image(systemName: "magnifyingglass")
                        //.rotationEffect(.degrees(90))
                        .fontWeight(.medium)
                        .onTapGesture {
                            showCitySearch = true
                            router.showScreen(.push) { _ in
                                SearchView()
                            }
                        }
                }
                .font(.system(size: 20))
                .fontWeight(.regular)
                .foregroundColor(Color.theme.accent)
                .background(
                    Color.theme.background.opacity(0.001))
                .onTapGesture {
                    showCitySearch.toggle()
                }
                
                Text("Welcome back!")
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
            }
            
            Spacer()
            
            CircleButtonView(iconName: "line.3.horizontal")
                .rotationEffect(Angle(degrees: showForecastList ? 180 : 0))
                .onTapGesture {
                    showForecastList = true
                    router.showScreen(.push) { _ in
                        ForecastListView()
                    }
                }
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var temperature: some View {
        VStack(spacing: 14) {
            if let firstForecast = vm.forecast?.data?.first,
               let weatherIcon = firstForecast.weather?.icon {
                Image("\(weatherIcon)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen / 2, height: screen / 2, alignment: .center)
            }
            HStack {
                Text(vm.forecast?.data?.first?.temp?.description ?? "Temperature")
                Text("°C")
            }
            .foregroundColor(Color.theme.accent)
            .fontWeight(.heavy)
            .font(.system(size: 55))
            .shadow(
                color: Color.theme.accent.opacity(0.50),
                radius: 20, x: 0, y: 0
            )
            
            Text(vm.forecast?.data?.first?.weather?.description?.capitalized ?? "Weather Description")
                .foregroundColor(Color.theme.accent)
                .fontWeight(.medium)
                .font(.system(size: 24))
            Text(formattedDateAndTime())
                .foregroundColor(Color.theme.accent)
                .fontWeight(.regular)
                .font(.system(size: 18))
            HStack(alignment: .center, spacing: 8) {
                Text("Next 16 days")
                    .foregroundColor(.clear)
                    .fontDesign(.rounded)
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                                       startPoint: .leading,
                                       endPoint: .trailing)
                        .mask(Text("Next 16 days")
                            .font(.system(size: 23))
                            .fontWeight(.medium)
                        )
                    )
                
                Image(systemName: "arrow.right.circle.fill")
            }
            .fontWeight(.medium)
            .font(.system(size: 23))
            .onTapGesture {
                showForecastList = true
                router.showScreen(.push) { _ in
                    ForecastListView()
                }
            }
        }
    }
}

