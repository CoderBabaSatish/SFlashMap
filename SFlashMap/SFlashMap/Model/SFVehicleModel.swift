//
//  SFVehicleModel.swift
//  SFlashMap
//
//  Created by Satish on 3/24/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import UIKit

struct SFVehicleModel: Codable {
    
    let batteryLevel: Int?
    let currency: String?
    let description: String?
    let id: Int?
    let latitude: Double?
    let longitude: Double?
    let name: String?
    let price: Int?
    let priceTime: Int?
    let timestamp: String?
    
   /*
    batteryLevel = 98;
    currency = "\U20ac";
    description = "Electric Scooter";
    id = 1;
    latitude = "52.529077";
    longitude = "13.416351";
    name = 000011;
    price = 15;
    priceTime = 60;
    timestamp = "2019-03-10T09:31:56Z";
    */
    
    init(batteryLevel: Int, currency: String, description: String, id: Int, latitude: Double, longitude: Double, name: String, price: Int, priceTime: Int, timestamp: String) {
        
        self.batteryLevel = batteryLevel
        self.currency = currency
        self.description = description
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.price = price
        self.priceTime = priceTime
        self.timestamp = timestamp
    }
    
}



/**
extension SFVehicleModel: Decodable {

//    private enum SFVehicleModelCodingKeys: String, CodingKeys {
//        case page
//        case batteryLevel
//        case currency
//        case description
//        case id
//        case latitude
//        case longitude
//        case name
//        case price
//        case priceTime
//        case timestamp
//    }

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        batteryLevel = try values.decode(Int.self, forKey: .batteryLevel)
        currency = try values.decode(String.self, forKey: .currency)
        id = try values.decode(Int.self, forKey: .id)
         latitude = try values.decode(String.self, forKey: .latitude)
         longitude = try values.decode(String.self, forKey: .longitude)
         name = try values.decode(String.self, forKey: .name)
         price = try values.decode(Int.self, forKey: .price)
         priceTime = try values.decode(String.self, forKey: .priceTime)
         timestamp = try values.decode(String.self, forKey: .timestamp)
         description = try values.decode(String.self, forKey: .description)

    }

}
 */

