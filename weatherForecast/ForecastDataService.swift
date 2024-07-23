//
//  ForecastDataService.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation
import Combine
import CoreLocation


class ForecastDataService: ObservableObject {
    @Published var allForecasts: [ForecastData] = []
    private var locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()

    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        setupBindings()
    }

    private func setupBindings() {
        locationManager.locationSubject
            .sink(receiveValue: { [weak self] location in
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                self?.getForecasts(lat: lat, lon: lon)
            })
            .store(in: &cancellables)
    }

    func getForecasts(lat: Double, lon: Double) {
        guard let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?lat=\(lat)&lon=\(lon)&days=16&lang=uk&key=b772a64ad1e34d25946efd0a0e999016") else {
            print("Invalid URL")
            return
        }

        NetworkingManager.download(url: URLRequest(url: url))
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] forecastResponse in
                self?.allForecasts = forecastResponse.data ?? []
                print("Forecasts: \(String(describing: forecastResponse.data))")
            })
            .store(in: &cancellables)
    }
}
