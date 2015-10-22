//
//  PersonInfo.swift
//  WeSafe
//
//  Created by Fhict on 22/10/15.
//  Copyright © 2015 Fhict. All rights reserved.
//

import Foundation

class PersonInfo {
    
    private var Info : String
    private var Name : String
    private var EmergencyNumber : String
    private var EmergencyNumber2 : String
    private var UUID : String
    
    init()
    {
        Info = ""
        Name = ""
        EmergencyNumber = ""
        EmergencyNumber2 = ""
        
    }
    
    init(info : String, name : String, en1 : String, en2 : String)
    {
        
        Info = info
        Name = name
        EmergencyNumber = en1
        EmergencyNumber2 = en2
        UUID = "1"
    }
    
    class var sharedInsance : PersonInfo{
        struct Static{
            static let instance : PersonInfo = PersonInfo()
        }
        return Static.instance
    }
    
    

    
    private let ITEMS_KEY = "todoItems"
    
    func addItem(item: TodoItem) { // persist a representation of this todo item in NSUserDefaults
        var todoDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ITEMS_KEY) ?? Dictionary() // if todoItems hasn't been set in user defaults, initialize todoDictionary to an empty dictionary using nil-coalescing operator (??)
        
        todoDictionary[item.UUID] = ["deadline": item.deadline, "title": item.title, "UUID": item.UUID] // store NSData representation of todo item in dictionary with UUID as key
        NSUserDefaults.standardUserDefaults().setObject(todoDictionary, forKey: ITEMS_KEY) // save/overwrite todo item list
        
        // create a corresponding local notification
        var notification = UILocalNotification()
        notification.alertBody = "Todo Item \"\(item.title)\" Is Overdue" // text that will be displayed in the notification
        notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.fireDate = item.deadline // todo item due date (when notification will be fired)
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.userInfo = ["UUID": item.UUID, ] // assign a unique identifier to the notification so that we can retrieve it later
        notification.category = "TODO_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
}