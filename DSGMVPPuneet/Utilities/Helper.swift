//
//  Helper.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import Foundation

class Helpers: NSObject {
    
    
    static let sharedInstance = Helpers()
    
    public func convertDateFormatter(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "EEE, dd MMM yyyy, hh:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        return timeStamp
    }
    
}
