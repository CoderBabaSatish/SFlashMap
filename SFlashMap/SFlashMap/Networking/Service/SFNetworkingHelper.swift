//
//  SFNetworkingHelper.swift
//  SFlashMap
//
//  Created by Satish on 3/24/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import Alamofire

/**
 */
class SFNetworkingHelper: NSObject {
    
    enum NetworkResponse:String {
        case success
        case authenticationError = "You need to be authenticated first."
        case badRequest = "Bad request"
        case outdated = "The url you requested is outdated."
        case failed = "Network request failed."
        case noData = "Response returned with no data to decode."
        case unableToDecode = "We could not decode the response."
    }
    
    enum Result<String>{
        case success
        case failure(String)
    }
    
    let request = NSMutableURLRequest()
    let type = Int()
    
    func SFNetworkingHelper(){
        
    }
    
    func initiateNetwordCallGet(method: String,completion: @escaping (_ vehicle: [SFVehicleModel]?,_ error: String?)->()){
        
        //--format usr and mathod
        let serviceURL =  SFServicesEndpoint().getServiceUrl(method: method)

        Alamofire.request(serviceURL, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return .failure(NetworkResponse.noData.rawValue as! Error)
                }
                do {
                    print("responseData: ", responseData)
                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    print("jsonData: ", jsonData)
                    
                    print("\n apiResponse: Start parsing\n")

                    let apiResponse = try JSONDecoder().decode([SFVehicleModel].self, from: responseData)
                    print("\n apiResponse: \n", jsonData)
                    completion(apiResponse,nil)
                }catch {
                    print(error)
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
                
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
   /*
    func initiateNetwordCallPost(page: Int, completion: @escaping (_ vehicle: [SFVehicleModel]?,_ error: String?)->()){
        
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
        }
    }
    */
    
    
    /**
     func testingggg() -> Void {
     
     Alamofire.request(urlString).responseJSON { response in
     guard case let .failure(error) = response.result else { return }
     
     if let error = error as? AFError {
     switch error {
     case .invalidURL(let url):
     print("Invalid URL: \(url) - \(error.localizedDescription)")
     case .parameterEncodingFailed(let reason):
     print("Parameter encoding failed: \(error.localizedDescription)")
     print("Failure Reason: \(reason)")
     case .multipartEncodingFailed(let reason):
     print("Multipart encoding failed: \(error.localizedDescription)")
     print("Failure Reason: \(reason)")
     case .responseValidationFailed(let reason):
     print("Response validation failed: \(error.localizedDescription)")
     print("Failure Reason: \(reason)")
     
     switch reason {
     case .dataFileNil, .dataFileReadFailed:
     print("Downloaded file could not be read")
     case .missingContentType(let acceptableContentTypes):
     print("Content Type Missing: \(acceptableContentTypes)")
     case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
     print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
     case .unacceptableStatusCode(let code):
     print("Response status code was unacceptable: \(code)")
     }
     case .responseSerializationFailed(let reason):
     print("Response serialization failed: \(error.localizedDescription)")
     print("Failure Reason: \(reason)")
     }
     
     print("Underlying error: \(error.underlyingError)")
     } else if let error = error as? URLError {
     print("URLError occurred: \(error)")
     } else {
     print("Unknown error: \(error)")
     }
     }
     }
     */
    
}
