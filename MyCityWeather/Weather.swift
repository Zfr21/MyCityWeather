//
//  Weather.swift
//  MyCityWeather
//
//  Created by Zafer Celaloglu on 16.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation
import Alamofire

class Weather {

    private var _city: String!
    private var _temperature: String!
    private var _pressure: String!
    private var _hummidity: String!
    private var _wind: String!
    private var _sunrise: String!
    private var _sunset: String!
    private var _description: String!
    private var _iconImage: String!
    private var _apiUrl: String!

    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    var temperature: String {
        if _temperature == nil {
            _temperature = ""
        }
        return _temperature
    }
    var pressure: String {
        if _pressure == nil {
            _pressure = ""
        }
        return _pressure
    }
    var humidity: String {
        if _hummidity == nil {
            _hummidity = ""
        }
        return _hummidity
    }
    var wind: String {
        if _wind == nil {
            _wind = ""
        }
        return _wind
    }
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }

    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }

    var iconImage: String {
        if _iconImage == nil {
            _iconImage = ""
        }
        return _iconImage
    }

    init(city: String) {
        _city = city
        _apiUrl = "\(BASE_URL)\(_city)\(API_KEY)"
    }

    func parseWeatherDetails(completed: DownloadComplete) {

        let url = NSURL(string: _apiUrl)!

        Alamofire.request(.GET, url).responseJSON { response in

            if let dict = response.result.value as? Dictionary<String, AnyObject> {

                if let city = dict["name"] as? String {
                    self._city = city
                }

                if let weather = dict["main"] as? Dictionary<String, Double> where weather.count > 0 {
                    if let temp1 = weather["temp"] {
                        self._temperature = convertToCelcius(temp1)
                    }
                    if let hum1 = weather["humidity"] {
                        let hum = Int(hum1)
                        self._hummidity = "\(hum)%"
                    }
                    if let press1 = weather["pressure"] {
                        let press = Int(press1)
                        self._pressure = "\(press)kPa"
                    }
                }

                if let weather = dict["wind"] as? Dictionary<String, Double> where weather.count > 0 {
                    if let wind1 = weather["speed"] {
                        let wind = Int(wind1)
                        self._wind = "\(wind)km/h"
                    }
                }

                if let weather = dict["sys"] as? Dictionary<String, AnyObject> where weather.count > 0 {

                    if let sunrise1 = weather["sunrise"] as? NSNumber{
                        let sunrise = NSDate(timeIntervalSince1970: Double(sunrise1))
                        self._sunrise = "\(sunrise.hour()):\(sunrise.minute())"
                    }

                    if let sunset1 = weather["sunset"] as? NSNumber {
                        let sunset = NSDate(timeIntervalSince1970: Double(sunset1))
                        self._sunset = "\(sunset.hour()):\(sunset.minute())"
                    }
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {

                    if let icon = weather[0]["icon"] as? String {

                        switch icon {

                        case "01d":
                            self._iconImage = "01d"
                        case "01n":
                            self._iconImage = "01n"
                        case "02d":
                            self._iconImage = "02d"
                        case "02n":
                            self._iconImage = "02n"
                        case "03d":
                            self._iconImage = "03d"
                        case "03n":
                            self._iconImage = "03n"
                        case "04d":
                            self._iconImage = "04d"
                        case "04n":
                            self._iconImage = "04d"
                        default:
                            self._iconImage = "10d"
                            
                        }
                    }
                }
                completed()
            }
            
        }
        
    }
}