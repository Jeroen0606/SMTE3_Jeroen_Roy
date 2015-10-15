//
//  ViewController.swift
//  Accelerometer
//
//  Created by Fhict on 15/10/15.
//  Copyright © 2015 Roy Timmers. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController{
    
    let manager = CMMotionManager()
    
    @IBOutlet var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if manager.accelerometerAvailable {
            manager.accelerometerUpdateInterval = 0.01
            manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
                data, error in
                
                let rotation = atan2(data!.acceleration.x, data!.acceleration.y) - M_PI
                print(rotation)
                self.text.text = rotation.description
                
                
                
                
            }
        }	
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

