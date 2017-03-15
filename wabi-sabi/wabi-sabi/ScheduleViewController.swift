//
//  ScheduleViewController.swift
//  wabi-sabi
//
//  Created by Hutchison, Gabriel on 3/13/17.
//  Copyright (c) 2017 Hutchison, Gabriel. All rights reserved.
//

import UIKit

class ScheduleViewController: DownloadListViewController {
    
    let debugging = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func cacheFileName() -> String {
        return "cache_data.json"
    }
    
    override func dataURL() -> String {
        if debugging {
            return "https://www.polyhacks.com/eventData/test.json"
        } else {
            return "https://www.polyhacks.com/eventData/data.json"
        }
    }
    
    override func dataKey() -> String {
        return "schedule"
    }
    
    override func cellReuseID() -> String {
        return "ScheduleCell"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // get data
        let title = tableData[indexPath.row].0
        let desc = tableData[indexPath.row].1
        let time = tableData[indexPath.row].2
        let ext_desc = tableData[indexPath.row].3
        
        // display data
        let alert = UIAlertController(title: title, message: "Starts at \(time)\n\n\(desc)\n\(ext_desc)", preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
    }
}
