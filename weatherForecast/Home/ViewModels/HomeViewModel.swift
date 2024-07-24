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
        locationManager.requestLocation()
    }
}





