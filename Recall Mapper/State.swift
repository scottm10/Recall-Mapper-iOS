//
//  State.swift
//  Recall Mapper
//
//  Created by Scott Magee on 7/22/15.
//  Copyright © 2015 Scott Magee. All rights reserved.
//

import Foundation
import MapKit

class State: NSObject {
    
    let name:String!
    let abbreviation:String!
    let polygon:MKPolygon!
    
    init(name:String, abbreviation:String, polygon:MKPolygon){
        self.name = name
        self.abbreviation = abbreviation
        self.polygon = polygon
    }

}
