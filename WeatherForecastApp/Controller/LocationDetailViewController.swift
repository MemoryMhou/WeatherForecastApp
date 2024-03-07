//
//  LocationDetailViewController.swift
//  WeatherForecastApp
//
//  Created by Memory Mhou on 07/03/2024.
//
import Foundation
import UIKit
import GooglePlaces
import UIKit

class LocationDetailViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var weatherLocation: WeatherLocation = WeatherLocation(name: "Current Location", latitude: 0.0, longitude: 0.0)
    var weatherLocations: [WeatherLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherLocations.append(weatherLocation)
        updateUserInterface()
    }
    
    func updateUserInterface(){
        dateLabel.text = ""
        placeLabel.text = weatherLocation.name
        temperatureLabel.text = "--°"
        summaryLabel.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationListViewController {
            destination.weatherLocations = weatherLocations
        }
    }
    
    @IBAction func unwindFromLocationListViewController(segue: UIStoryboardSegue){
        if let source = segue.source as? LocationListViewController {
            weatherLocations = source.weatherLocations
            weatherLocation = weatherLocations[source.selectedLocationIndex]
            updateUserInterface()
        }
    }
}
