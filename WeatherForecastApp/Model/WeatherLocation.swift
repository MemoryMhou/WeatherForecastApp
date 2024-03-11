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

    func getData() {
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=-26.201450&lon=28.045490&exclude={part}&appid=f28746cc3ab15aea71c19429ad099367"
        
        guard let url = URL(string: urlString) else {
            print ("Error: could not create a url from \(urlString)")
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url){ (data,Response,error) in
            if let error = error {
                print ("Error: \(error.localizedDescription)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(" 😇 \(json)")
            } catch {
                print ("JSON ERROR: \(error.localizedDescription)")
            }
        }
    }
}
