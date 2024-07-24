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
    @Published var forecast: Forecast?
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
                print("Received location: lat = \(lat), lon = \(lon)")
                self?.getForecasts(lat: lat, lon: lon)
            })
            .store(in: &cancellables)
    }

    func getForecasts(lat: Double, lon: Double) {
        let urlString = "https://api.weatherbit.io/v2.0/forecast/daily?lat=\(lat)&lon=\(lon)&days=16&lang=uk&key=b772a64ad1e34d25946efd0a0e999016"
        print("Request URL: \(urlString)")

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        NetworkingManager.download(url: URLRequest(url: url))
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully")
                case .failure(let error):
                    print("Request failed with error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] forecastResponse in
                self?.forecast = forecastResponse
                print("Forecast received: \(String(describing: forecastResponse))")
            })
            .store(in: &cancellables)
    }

    func getForecasts(for cityName: String, completion: @escaping (Bool) -> Void) {
        let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://api.weatherbit.io/v2.0/forecast/daily?city=\(encodedCityName)&days=16&lang=uk&key=b772a64ad1e34d25946efd0a0e999016"
        print("Request URL: \(urlString)")

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(false)
            return
        }

        NetworkingManager.download(url: URLRequest(url: url))
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { receiveCompletion in
                switch receiveCompletion {
                case .finished:
                    print("Request completed successfully")
                case .failure(let error):
                    print("Request failed with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
            }, receiveValue: { [weak self] forecastResponse in
                self?.forecast = forecastResponse
                print("Forecast received: \(String(describing: forecastResponse))")
                completion(true)
            })
            .store(in: &cancellables)
    }
}
