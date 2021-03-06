//
//  DetailsViewController.swift
//  Assignment4.1
//
//  Created by Fhict on 01/10/15.
//  Copyright (c) 2015 Fhict. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectedEmergency: Emergency?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLife: UILabel!
    @IBOutlet weak var lblActiveYears: UILabel!
    @IBOutlet weak var lblCountryOfBirth: UILabel!
    
    @IBOutlet weak var tfComments: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblName.text = self.selectedEmergency?.Titel
        self.lblLife.text = self.selectedEmergency?.Date
        self.tfComments.text = self.selectedEmergency?.Description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
