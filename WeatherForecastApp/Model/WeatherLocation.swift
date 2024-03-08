//
//  WeatherLocation.swift
//  WeatherForecastApp
//
//  Created by Memory Mhou on 07/03/2024.
//

import Foundation


class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

}
