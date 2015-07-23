//
//  MapViewController.swift
//  Recall Mapper
//
//  Created by Scott Magee on 7/22/15.
//  Copyright © 2015 Scott Magee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var states = createStates()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapViewDidFinishLoadingMap(mapView: MKMapView){
        for state in states{
            drawState(state)
        }
    }
    
    func drawState(state:State) {
        mapView.addOverlay(state.polygon)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.fillColor = UIColor.redColor().colorWithAlphaComponent(0.1)
        renderer.strokeColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        renderer.lineWidth = 3;
        return renderer
    }

}
