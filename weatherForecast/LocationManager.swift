//
//  LocationManager.swift
//  weatherForecast
//
//  Created by Vladyslav Mi on 23.07.2024.
//

import Foundation
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocation? = nil
    
    let locationSubject = PassthroughSubject<CLLocation, Never>()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        self.location = latestLocation
        locationSubject.send(latestLocation)
        print("Updated location: \(latestLocation.coordinate.latitude), \(latestLocation.coordinate.longitude)") // Додаткове логування
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
