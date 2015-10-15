//
//  CoreLocationManager.swift
//  GPSTest
//
//  Created by Fhict on 15/10/15.
//  Copyright (c) 2015 Fhict. All rights reserved.
//

import Foundation

class CoreLocationManager {
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
}