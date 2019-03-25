//
//  SFVehicleMarkerView.swift
//  SFlashMap
//
//  Created by Satish on 3/24/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import MapKit

class SFVehicleMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let vehicleMarker = newValue as? SFVehicleMArker else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = vehicleMarker.markerTintColor
            if let imageName = vehicleMarker.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
        }
    }
    
}


class SFVehicleMarker: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let vehicleMarker = newValue as? SFVehicleMArker else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
//            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
//                                                    size: CGSize(width: 30, height: 30)))
//            mapsButton.setBackgroundImage(UIImage(named: "Map-icon"), for: UIControl.State())
//            rightCalloutAccessoryView = mapsButton
                  rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if let imageName = vehicleMarker.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 4
            detailLabel.font = detailLabel.font.withSize(12)
            //detailLabel.text = vehicleMarker.title! + "\n Name: " + vehicleMarker.title!
            
            let combineStr = "\n Name:\(String(describing: vehicleMarker.locationName))\n Price:\(String(describing: vehicleMarker.price)) \(String(describing: vehicleMarker.currency))\n Time: \(String(describing: vehicleMarker.timestamp))\n Battery Level:\(String(describing: vehicleMarker.batteryLevel))"
            
            detailLabel.text = combineStr
            
            //let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

            detailCalloutAccessoryView = detailLabel
        }
    }
    
}

//---------------------------END----------------------------------------

