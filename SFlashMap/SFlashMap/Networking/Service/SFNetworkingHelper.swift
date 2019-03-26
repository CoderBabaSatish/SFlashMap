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
  //  let baseURL =  NSURL(string:"https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles/1" as String)
    let params = NSObject()
    
   // var urlString = "https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles/"
    
    
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
    
    //func initiateNetwordCall(type: String, method: String, params: NSObject){
    func initiateNetwordCall() -> Void{
        
        // Alamofire 4
        let parameters: Parameters = ["": ""]
        
        
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
        
        // testingggg()
        
        //  let request = NSMutableURLRequest(url: baseURL! as URL)
        //    request.httpMethod = "GET"
        //    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //    let data = try! JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        //
        //    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        //    if let json = json {
        //        print(json)
        //    }
        //    request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
        //
        //
        //        // Alamofire 4
        //        Alamofire.request(urlString).response { response in // method defaults to `.get`
        //            print("Alamofire.request(urlString): Start \n\n")
        //
        //            print(response.request ?? "response.request")
        //            print("\n\n")
        //
        //            print(response.data ?? "response.data")
        //
        //            print("\n\n")
        //            print(response.response ?? "response.response")
        //
        //            print("\n\nAlamofire.request(urlString): End \n\n")
        //
        //
        //
        //        }
        
        //        Alamofire.request(.GET, request!).response { (_, _, data, error) in
        //            let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        //            println(str)
        //            println(error)
        //        }
        //
        //        Alamofire.request(.GET, request, parameters: nil, encoding: .URL).responseString(completionHandler: {
        //            (request: NSURLRequest, response: HTTPURLResponse?, responseBody: String?, error: NSError?) -> Void in
        //
        //            // Convert the response to NSData to handle with SwiftyJSON
        //            if let data = (responseBody as NSString).dataUsingEncoding(NSUTF8StringEncoding) {
        //                let json = JSON(data: data)
        //                println(json)
        //            }
        //        })
        
        
        //    Alamofire.request(request as! URLRequestConvertible)
        //        .responseJSON { response in
        //            // do whatever you want here
        //            print(response.request)
        //            print(response.response)
        //            print(response.data)
        //            print(response.result)
        //
        //    }
    }
    //
    //// With Alamofire
    //func fetchAllLocations(completion: @escaping ([RemoteRoom]?) -> Void) {
    //    guard let url = URL(string: "https://my-json-server.typicode.com/ FlashScooters/Challenge") else {
    //        completion(nil)
    //        return
    //    }
    //    Alamofire.request(url,
    //                      method: .get,
    //                      parameters: ["include_docs": "true"])
    //        .validate()
    //        .responseJSON { response in
    //            guard response.result.isSuccess else {
    //                print("Error while fetching remote rooms: \(String(describing: response.result.error)")
    //                    completion(nil)
    //                return
    //            }
    //
    //            guard let value = response.result.value as? [String: Any],
    //                let rows = value["rows"] as? [[String: Any]] else {
    //                    print("Malformed data received from fetchAllRooms service")
    //                    completion(nil)
    //                    return
    //            }
    //
    //            let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
    //            completion(rooms)
    //    }
    //}
    
    
    //func jsonRequest()
    //{
    //
    //    let url =  "url"
    //    //if you want to add paramter
    //    var parametr = ["username" : "user" , "password": ""]
    //
    //
    //    Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default)
    //        .responseJSON { response in
    //            // print(response)
    //            //to get status code
    //            if let status = response.response?.statusCode {
    //                switch(status){
    //                case 201:
    //                    print("example success")
    //                default:
    //                    print("error with response status: \(status)")
    //                }
    //            }
    //
    //            //to get JSON return value
    //            if let array = response.result.value as? //NSDictionary [[String : Any]]
    //            {
    //
    //
    //            }
    //    }
    //
    
}
