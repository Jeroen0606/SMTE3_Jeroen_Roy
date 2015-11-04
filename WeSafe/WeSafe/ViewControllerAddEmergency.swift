//
//  ViewControllerAddEmergency.swift
//  WeSafe
//
//  Created by Fhict on 16/10/15.
//  Copyright © 2015 Fhict. All rights reserved.
//

import UIKit

class ViewControllerAddEmergency: UIViewController {
    var emergency:Emergency?

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var dpDate: UIDatePicker!
    @IBOutlet weak var tfDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdd(sender: AnyObject) {
        emergency = Emergency(titel: tfTitle.text, date: dpDate.description, description: tfDescription.text!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! TableViewControllerHistory
        controller.emergencies.append(emergency!);
        
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
