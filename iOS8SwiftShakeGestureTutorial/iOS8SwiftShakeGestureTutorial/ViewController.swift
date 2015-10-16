//
//  ViewController.swift
//  iOS8SwiftShakeGestureTutorial
//
//  Created by Fhict on 15/10/15.
//  Copyright © 2015 Roy Timmers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    @IBOutlet weak var shakeLabel2: UILabel!
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            self.shakeLabel.text="Shaken, not stirred"
            self.shakeLabel2.text="Shaking"
            var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "resetLabel", userInfo: nil, repeats: false)
        
        }
    }
    
    func resetLabel()
    {
        self.shakeLabel.text="Shake me"
        self.shakeLabel2.text="Just shaken"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

