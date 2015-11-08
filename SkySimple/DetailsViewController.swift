//
//  DetailsViewController.swift
//  SkySimple
//
//  Created by user114307 on 11/8/15.
//  Copyright © 2015 Sam. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var countryName: String = "";
    var detailsList: NSMutableArray = NSMutableArray();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = countryName;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupDetails(country: NSDictionary)
    {
        countryName = country.objectForKey("name") as! String;
        detailsList = NSMutableArray();
        detailsList.addObject(["data": country.objectForKey("capital") as! String, "name": "Capital"]);
        detailsList.addObject(["data": country.objectForKey("region") as! String, "name": "Region"]);
        detailsList.addObject(["data": country.objectForKey("demonym") as! String, "name": "Demonym"]);
        detailsList.addObject(["data": String(country.objectForKey("population") as! Int), "name": "Population"]);
        
        let currenciesArray = country.objectForKey("currencies") as! NSArray;
        var currencies = "";
        var numCur = 0;
        for cur in currenciesArray
        {
            currencies += cur as! String;
            ++numCur;
            if(numCur < currenciesArray.count)
            {
                currencies += ", ";
            }
        }
        detailsList.addObject(["data": currencies, "name": "Currencies"]);
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsList.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
        
        let cellData = detailsList.objectAtIndex(indexPath.row) as! NSDictionary;
        
        cell.textLabel!.text = cellData.objectForKey("data") as? String;
        cell.detailTextLabel!.text = cellData.objectForKey("name") as? String;
        
        return cell
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
