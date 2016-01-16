//
//  Constants.swift
//  MyCityWeather
//
//  Created by Zafer Celaloglu on 16.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
let API_KEY = "&appid=2de143494c0b295cca9337e1e96b00e0"

typealias DownloadComplete = () -> ()

func convertToCelcius(let kelvin: Double) -> String {

    let integer = Int(kelvin)
    let celcius = "\( integer - 273)°C"

    return celcius
}