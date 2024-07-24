//
//  HomeViewModel.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var forecast: Forecast? = nil
    private var locationManager = LocationManager()
    private var forecastDataService: ForecastDataService
    private var cancellables = Set<AnyCancellable>()

    private var locationLoaded = false // Додайте цю властивість

    init() {
        forecastDataService = ForecastDataService(locationManager: locationManager)
        addSubscribers()
    }

    private func addSubscribers() {
        forecastDataService.$forecast
            .sink { [weak self] forecast in
                self?.forecast = forecast
            }
            .store(in: &cancellables)
    }

    func requestLocation() {
        if !locationLoaded {
            locationManager.requestLocation()
            locationLoaded = true
        }
    }

    func searchCity(_ cityName: String, completion: @escaping (Bool) -> Void) {
        let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        forecastDataService.getForecasts(for: encodedCityName) { success in
            if success {
                self.forecast = self.forecastDataService.forecast
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}






