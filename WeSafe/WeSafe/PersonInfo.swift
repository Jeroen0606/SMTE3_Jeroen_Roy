//
//  PersonInfo.swift
//  WeSafe
//
//  Created by Fhict on 22/10/15.
//  Copyright © 2015 Fhict. All rights reserved.
//

import Foundation
import UIKit;

class PersonInfo {
    
    public var Name : String = ""
    public var EmergencyNumber : String = "112"
    public var EmergencyNumber2 : String = ""
    private var UUID : String = "1"
    
        
    
    
    class var sharedInsance : PersonInfo{
        struct Static{
            static let instance : PersonInfo = PersonInfo()
        }
        return Static.instance
    }
    
    
    func notify() {
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertBody = "Name: " + Name + " Call in emergency: " + EmergencyNumber
        if(!EmergencyNumber2.isEmpty)
        {
            notification.alertBody?.appendContentsOf(" or call: " + EmergencyNumber2)
        }
        notification.alertAction = "open"
        notification.fireDate = nil
        notification.soundName = nil
        notification.userInfo = nil
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    func notifyDate(date : NSDate) {
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertBody = "Name: " + Name + " Call in emergency: " + EmergencyNumber
        if(!EmergencyNumber2.isEmpty)
        {
            notification.alertBody?.appendContentsOf(" or call: " + EmergencyNumber2)
        }
        notification.alertAction = "open"
        notification.fireDate = date
        notification.soundName = nil
        notification.userInfo = nil
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
}