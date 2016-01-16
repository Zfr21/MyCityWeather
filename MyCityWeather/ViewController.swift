//
//  ViewController.swift
//  MyCityWeather
//
//  Created by Zafer Celaloglu on 16.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureImg: UIImageView!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!

    var weather = Weather(city: "Aydin")

    override func viewDidLoad() {
        super.viewDidLoad()

        weather.parseWeatherDetails { () -> () in
            self.updateUI()
        }
    }

    func updateUI() {
        temperatureImg.image = UIImage(named: weather.iconImage)
        temperatureLbl.text = weather.temperature
        humidityLbl.text = weather.humidity
        pressureLbl.text = weather.pressure
        sunriseLbl.text = weather.sunrise
        sunsetLbl.text = weather.sunset
        windLbl.text = weather.wind
    }
    
}

