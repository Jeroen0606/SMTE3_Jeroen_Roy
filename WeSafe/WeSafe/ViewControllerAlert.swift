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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        if(CLLocationManager.locationServicesEnabled()) {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lblAlert: UILabel!
    @IBAction func btnAlert(sender: UIButton) {
        lblAlert.text = "Alert Activated!"
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
                    print(pm?.locality)
                    print(pm?.postalCode)
                    print(self.count++)
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
