//
//  FDAService.swift
//  Recall Mapper
//
//  Created by Scott Magee on 7/22/15.
//  Copyright © 2015 Scott Magee. All rights reserved.
//

import Foundation

let DRUG_ENFORCEMENT_URL = "https://api.fda.gov/drug/enforcement.json"
let DEVICE_ENFORCEMENT_URL = "https://api.fda.gov/device/enforcement.json"
let FOOD_ENFORCEMENT_URL = "https://api.fda.gov/food/enforcement.json"
let API_KEY = "W0AOLQFs6HbOkZD8uIcELIWpxg7kTCAywBcGfDVA"
let BEGIN_QUERY = "?api_key=\(API_KEY)"

class FDAService {
    
    weak var ref:ViewController!
    
    /**
    *
    **/
    func executeApiQuery(url:NSURL) -> Void {
        let theRequest = NSURLRequest(URL: url)
        
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(theRequest, completionHandler: {(possibleData:NSData?, response:NSURLResponse?, possibleError:NSError?) -> Void in
            if let data = possibleData{
                if data.length > 0 && possibleError == nil {
                    do {
                        let something: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                        if let actualInfo = something {
                            if let dict = actualInfo as? NSDictionary{
                                if let metaDict = dict.objectForKey("meta") {
                                    if let disclaimer = metaDict.objectForKey("disclaimer") as? String {
                                        dispatch_async(dispatch_get_main_queue(),{
                                            self.ref.updateDisclaimerLabelText(disclaimer)})
                                    }
                                    if let license = metaDict.objectForKey("license") as? String {
                                        dispatch_async(dispatch_get_main_queue(),{
                                            self.ref.updateLicenseLabelText(license)})
                                    }
                                }
                            }
                        }
                    } catch _ {
                        
                    }
                }
            } else {
                print(possibleError?.description)
            }
        })
        
        dataTask.resume()
    }
    
}
