//
//  Date+Extensions.swift
//  Appetizers
//
//  Created by lbr on 23/08/25.
//

import Foundation

extension Date {
    static func birthday(year: Int, month: Int, day: Int) -> Date {
        var comp = DateComponents()
        comp.calendar = Calendar(identifier: .gregorian)
        comp.timeZone = TimeZone(secondsFromGMT: 0)
        comp.year = year
        comp.month = month
        comp.day = day
        return comp.date!
    }
}
