//
//  ViewControllerAlert.swift
//  WeSafe
//
//  Created by Fhict on 16/10/15.
//  Copyright © 2015 Fhict. All rights reserved.
//

import UIKit
import CoreLocation

class ViewControllerAlert: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var count:Int = 0
    var locality : String?
    var postcode : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        if(CLLocationManager.locationServicesEnabled()) {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
            PersonInfo.sharedInsance.notify()
            for var i = 1; i<25; ++i{
                var date = NSDate()
                date = date.dateByAddingTimeInterval(3600*1)
                PersonInfo.sharedInsance.notifyDate(date)
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblAlert: UILabel!
    @IBAction func btnAlert(sender: UIButton) {
        lblLocation.text = locality! + " - " + postcode!
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            lblAlert.text = "Alert Activated!"
            
        }
    }
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
                print(self.count++)
                return
            }
            if placemarks?.count > 0 {
                let pm = placemarks?[0] as CLPlacemark?
                if(pm != nil)
                {
                    self.locality = pm?.locality
                    self.postcode = pm?.postalCode
                    //print(self.count++)
                }
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(" Error: " + error.localizedDescription)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
