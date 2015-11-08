//
//  Downloader.swift
//  SkySimple
//
//  Created by user114307 on 11/4/15.
//  Copyright © 2015 Sam. All rights reserved.
//

import UIKit
import Alamofire

class Downloader: NSObject
{
    static let sharedInstance = Downloader();
    
    var countriesList: NSArray = NSArray();
    
    override init()
    {
        super.init();
    }
    
    func download(completion: () -> Void)
    {
        Alamofire.request(.GET, "https://restcountries.eu/rest/v1/all").responseJSON { response in
            /*print(response.request);
            print(response.response);
            print(response.data);
            print(response.result);*/
            
            if(response.result.value is NSArray)
            {
                self.countriesList = response.result.value as! NSArray;
                
                
                completion();
            }
            
        }
        
    }

}
