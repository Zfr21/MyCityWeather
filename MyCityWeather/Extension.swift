//
//  Extension.swift
//  MyCityWeather
//
//  Created by Zafer Celaloglu on 16.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation

extension NSDate {

    func hour() -> Int {

        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: self)
        let hour = components.hour

        return hour
    }

    func minute() -> Int {

        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: self)
        let minute = components.minute

        return minute
    }
}