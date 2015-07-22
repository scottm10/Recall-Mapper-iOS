//
//  ViewController.swift
//  Recall Mapper
//
//  Created by Scott Magee on 7/22/15.
//  Copyright © 2015 Scott Magee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabelText(text:String) -> Void{
        self.testLabel.text = text
        self.testLabel.setNeedsLayout()
    }
    
    @IBAction func callAPI() -> Void {
        let service = FDAService()
        service.ref = self;
        let testUrl = NSURL(string: "https://api.fda.gov/drug/enforcement.json?search=_exists_:city+AND+_exists_:state")
        if let url = testUrl {
            service.executeApiQuery(url)
        }
    }


}

