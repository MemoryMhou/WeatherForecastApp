//
//  DailyTableViewCell.swift
//  WeatherForecastApp
//
//  Created by Memory Mhou on 13/03/2024.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dailyWeekdayLabel: UILabel!
    @IBOutlet weak var dailyHighLabel: UILabel!
    @IBOutlet weak var dailyImageView: UIImageView!
   
    var dailyWeather: DailyWeather! {
        didSet{
            dailyImageView.image = UIImage(named: dailyWeather.dailyIcon)
            dailyWeekdayLabel.text = dailyWeather.dailyWeekday
            dailyHighLabel.text = "\(dailyWeather.dailyHigh)°"
        }
    }
}
