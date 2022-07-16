//
//  LocationManager.swift
//  WeatherApp
//
//  Created by A Farhan Agustiansyah on 16/07/22.
//

import Foundation

/*
    CoreLocation is the framework from Apple
    We'll use to get the user's current location
*/
import CoreLocation

/*
    use few protocols which allow us to manage everything
    related to location without running into error
*/
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
