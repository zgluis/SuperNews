//
//  Dateformatter.swift
//  SuperNews
//
//  Created by Luis Zapata on 12-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//
import Foundation

extension DateFormatter {
    /**
     Formats a date as the time since that date (e.g., “Last week, yesterday, etc.”).
     
     - Parameter from: The date to process.
     - Parameter numericDates: Determines if we should return a numeric variant, e.g. "1 month ago" vs. "Last month".
     
     - Returns: A string with formatted `date`.
     */
    func timeSince(from: NSDate, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!)y"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1 year"
            } else {
                result = "last year"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!) months"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1 m"
            } else {
                result = "last month"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!)w"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 week"
            } else {
                result = "last week"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!)d"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1 day"
            } else {
                result = "yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!)h"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 hour"
            } else {
                result = "one hour"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!)m"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1m"
            } else {
                result = "one minute"
            }
        } else if components.second! >= 3 {
            result = "right now" //"\(components.second!) seconds ago"
        } else {
            result = "right now"
        }
        
        return result
    }
    
    func getReadableDate(date: NSDate) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = earliest == now as Date ? date : now
        let components = calendar.dateComponents([.year], from: earliest, to: latest as Date)
        
        if components.year! >= 1 {
            self.dateFormat = "d MMM yy HH:mm a"
        } else {
            self.dateFormat = "d MMM HH:mm a"
        }
        
        return self.string(from: date as Date)
    }
    
}
