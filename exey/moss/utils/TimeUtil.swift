//
//  TimeUtil.swift
//  VEKA_Measurer
//
//  Created by Exey Panteleev on 16/04/15.
//  Copyright (c) 2015 Exey Panteleev. All rights reserved.
//

import Foundation

public struct TimeUtil {
    
    static var timeIntervalSince1970MilliSeconds: NSTimeInterval { return NSDate().timeIntervalSince1970 * 1000 }
    static var timeIntervalSince1970MilliSecondsInt64:Int64 { return Int64(timeIntervalSince1970MilliSeconds) }
    
    /** Delay / Use name for repeatable calls */
    typealias Closure = ()->()
    static private var closures = [String: Closure]()
    static func delayCall(delay: Double, var name: String? = nil, closure: Closure) {
        if(name == nil) {
            name = dateNow()
        }
        closures[name!] = closure
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()) {
                if let closure = self.closures[name!] {
                    closure()
                    self.closures[name!] = nil
                }
        }
    }
    
    /** Get current Time */
    static func dateNow(format:String = "yyyy-MM-dd'T'HH:mm:ss.SSS")->String {
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        var timeZone:NSTimeZone = NSTimeZone(name: "UTC")!
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = format
        let now:NSDate = NSDate()
        return dateFormatter.stringFromDate(now)
    }
    
    static func secondsToComponents(seconds:Int) -> (Int, Int, Int, Int) {
        let days = seconds / (3600*24)
        let hours = (seconds % (3600*24)) / 3600
        let minutes = (seconds % (3600*24))%3600 / 60
        let seconds = seconds - days * 3600*24 - hours*3600 - minutes*60
        return (days, hours, minutes, seconds)
    }
    
    static func formatTime(seconds:Int) -> String {
        let (days, hours, minutes, seconds) = secondsToComponents(seconds)
        var result:NSString = NSString(format: "%02d : %02d : %02d : %02d", days, hours, minutes, seconds)
        return String(format: result as String)
    }
}