//
//  HomeViewModel.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var forecasts: [ForecastData] = []
    @Published var forecastsFirst: [Forecast] = []

    private var locationManager: LocationManager
    private var forecastDataService: ForecastDataService
    private var cancellables = Set<AnyCancellable>()

    init(locationManager: LocationManager = LocationManager()) {
        self.locationManager = locationManager
        forecastDataService = ForecastDataService(locationManager: locationManager)
        addSubscribers()
    }

    private func addSubscribers() {
        forecastDataService.$allForecasts
            .sink { [weak self] forecasts in
                self?.forecasts = forecasts
            }
            .store(in: &cancellables)
    }

    func requestLocation() {
        locationManager.requestLocation()
    }
}


