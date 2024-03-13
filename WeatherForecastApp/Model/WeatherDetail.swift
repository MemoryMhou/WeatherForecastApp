//  WeatherForecastApp
//
//  Created by Memory Mhou on 12/03/2024.
//

import Foundation

class WeatherDetail: WeatherLocation {

    struct Result: Codable {
        let timezone: String
        let current: Current
    }

    struct Current: Codable {
        let dt: TimeInterval
        let temp: Double
        let weather: [Weather]
    }

    struct Weather: Codable {
        let description: String
        let icon: String
    }

    var timezone = ""
    var currentTime = 0.0
    var temperature = 0
    var summary = ""
    
    
    func getData(completed: @escaping () -> ()) {
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=imperial&appid=f28746cc3ab15aea71c19429ad099367"
        
        print("😇 we are accessing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print ("Error: could not create a URL from \(urlString)")
            completed()
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // Get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print ("Error: \(error.localizedDescription)")
            }
            
            do {
  
                let result = try JSONDecoder().decode(Result.self,from: data!)
                self.timezone = result.timezone
                self.currentTime = Double(result.current.dt)
                self.temperature = Int(result.current.temp.rounded())
                self.summary = result.current.weather[0].description

            } catch {
                print ("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
