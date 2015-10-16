//
//  ViewController.swift
//  GPSTest
//
//  Created by Fhict on 15/10/15.
//  Copyright (c) 2015 Fhict. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{

    var count :Int = 0
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        if(CLLocationManager.locationServicesEnabled()){
            
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.startUpdatingLocation()
        
        }
        
    }
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationManager.location != nil {
            let initLocation = CLLocation(
                latitude: locationManager.location!.coordinate.latitude,
                longitude: locationManager.location!.coordinate.longitude
            )
        }
        
        let location = locationManager.location!
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            if error != nil
            {
                print("Failed")
                return
            }
            if placemarks?.count > 0 {
                let pm = placemarks?[0] as CLPlacemark?
                if(pm != nil)
                {
                    self.lblLocation.text = pm?.locality
                    self.lblPostcode.text = pm?.postalCode
                    print(self.count++)
                    print(pm?.locality)
                    print(pm?.postalCode)
                }
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(" Error: " + error.localizedDescription)
    }

}

