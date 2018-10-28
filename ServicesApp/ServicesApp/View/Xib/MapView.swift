//
//  MapView.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView{
    
    @IBOutlet weak var mapView: MKMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
    }
    
    func instanceFromNib() -> UIView {
        return UINib(nibName: "MapView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    private func commomInit(){
        let view = instanceFromNib()
        self.addSubview(view)
        
        view.backgroundColor = .clear
    }
    
    func centerOnLocation(lat: Double, long: Double) {
        let designatedLocation = CLLocation(latitude: lat, longitude: long)
        let regionRadius: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegion(center: designatedLocation.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
