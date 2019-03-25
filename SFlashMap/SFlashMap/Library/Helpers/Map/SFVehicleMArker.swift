//
//  SFVehicleMArker.swift
//  SFlashMap
//
//  Created by Satish on 3/24/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import MapKit
import Contacts


class SFVehicleMArker: NSObject, MKAnnotation {
    let title: String?
    let locationName: String!
    let discipline: String?
    let coordinate: CLLocationCoordinate2D

    let batteryLevel: Int!
    let currency: String!
    let id: Int?
    let latitude: Double?
    let longitude: Double?
    let price: Int!
    let priceTime: Int!
    let timestamp: String!
    
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, vehiclemodel: SFVehicleModel ) {
        self.title = vehiclemodel.description
        self.locationName = vehiclemodel.name
        self.discipline = discipline
        self.coordinate = coordinate
        
        self.batteryLevel = vehiclemodel.batteryLevel
        self.currency = vehiclemodel.currency
        self.id = vehiclemodel.id
        self.latitude = vehiclemodel.latitude
        self.longitude = vehiclemodel.longitude
        self.price = vehiclemodel.price
        self.priceTime = vehiclemodel.priceTime
        self.timestamp = vehiclemodel.timestamp
    
        super.init()
    }

    var subtitle: String? {
        return locationName
    }
    
    // pinTintColor for disciplines: red, cyan, blue, purple, other
    var markerTintColor: UIColor  {
        switch discipline {
        case "red":
            return .red
        case "cyan":
            return .cyan
        case "blue":
            return .blue
        case "purple":
            return .purple
        default:
            return .green
        }
    }
    
    var imageName: String? {
        return "Map-icon"
    }
    
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
}
