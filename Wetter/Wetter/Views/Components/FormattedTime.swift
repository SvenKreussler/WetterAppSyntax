//
//  FormattedTime.swift
//  Wetter
//
//  Created by Sven Kreußler on 14.12.23.
//
//  abstract: styling of unix time into common time format

import Foundation

func formattedTime(for timestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm" // Use "hh:mm a" for 12-hour format with AM/PM
    return dateFormatter.string(from: date)
}

func formattedTimeWeekDay(for timestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE" // Use "hh:mm a" for 12-hour format with AM/PM
    return dateFormatter.string(from: date)
}
