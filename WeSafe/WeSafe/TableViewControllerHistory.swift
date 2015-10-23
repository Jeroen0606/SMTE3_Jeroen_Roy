//
//  TableViewControllerJson.swift
//  JSONTest
//
//  Created by Fhict on 22/10/15.
//  Copyright © 2015 Fhict. All rights reserved.
//

import UIKit

class TableViewControllerHistory: UITableViewController {
    var emergencies = [Emergency]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emergencies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let currentRow = indexPath.row;
        
        let currentEmergency = self.emergencies[currentRow]
        cell.textLabel?.text = currentEmergency.Date + ": " + currentEmergency.Titel
        
        
        return cell;
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let selectedRow = self.tableView.indexPathForSelectedRow
//        let selectedEmergency = self.emergencies[selectedRow!.section]
//        
//        let controller = segue.destinationViewController as! DetailsViewController
//        controller.selectedEmergency = selectedEmergency;
//        
//    }

    
    func loadJsonData() {
        let url = NSURL(string: "http://athena.fhict.nl/users/i272062/JSON/emergencies.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        var parseError:NSError?
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            do {
                let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!,options: NSJSONReadingOptions.AllowFragments)
                self.parseJsonData(jsonObject)
            } catch let error as NSError {
                parseError = error
            } catch {
                fatalError()
            }
        })
        dataTask.resume();
    }
    
    func parseJsonData(jsonObject:AnyObject)
    {
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newEmergency = Emergency(
                    titel: item.objectForKey("titel") as! String,
                    date: item.objectForKey("date") as! String,
                    description: item.objectForKey("description") as! String
                )
                emergencies.append(newEmergency)
            }
        }
        self.tableView.reloadData()
    }
    
    


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
