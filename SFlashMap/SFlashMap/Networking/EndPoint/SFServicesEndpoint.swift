//
//  SFServicesEndpoint.swift
//  SFlashMap
//
//  Created by Satish on 3/26/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation

class SFServicesEndpoint: NSObject {
    
   let baseURL = "https://my-json-server.typicode.com/FlashScooters/"
    
    
    
    func getServiceUrl(method: String) -> String {
    
        let urlstring = self.baseURL + method
        return urlstring;
    }

}
