//
//  ViewController.swift
//  Recall Mapper
//
//  Created by Scott Magee on 7/22/15.
//  Copyright © 2015 Scott Magee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.callAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisclaimerLabelText(text:String) -> Void{
        self.disclaimerLabel.text = text
        self.disclaimerLabel.setNeedsUpdateConstraints()
        self.disclaimerLabel.setNeedsLayout()
    }
    
    func updateLicenseLabelText(text:String) -> Void{
        self.licenseLabel.text = text
        self.licenseLabel.setNeedsLayout()
    }
    
    func callAPI() -> Void {
        let service = FDAService()
        service.ref = self;
        let testUrl = NSURL(string: "https://api.fda.gov/drug/enforcement.json?")
        if let url = testUrl {
            service.executeApiQuery(url)
        }
    }


}

