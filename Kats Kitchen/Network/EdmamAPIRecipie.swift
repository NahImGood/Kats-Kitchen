//
//  EdmamAPI.swift
//  Kats Kitchen
/*
    Used for Comunicating to the Recipie Searching API
 
 */
//  Created by Eli Warner on 6/21/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import Foundation
import Gzip


class EdamamAPIRecipie {
    
    enum EndPoints {
        static let base = "https://api.edamam.com/"
        static let searchBase = "https://api.edamam.com/search"
        static let spanishBase = "https://test-es.edamam.com/"
        static let apiID = Config.ApiID
        static let apiKey = Config.ApiKey
        case search
        
        var stringValue: String {
            switch self {
            case .search:
                return EdamamAPIRecipie.EndPoints.searchBase
            }
        }
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func dataTaskForSearch(_ method: String, url: URL, completion: @escaping (_ result: Data?, _ error: Error?)-> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Entered Error State In TaskForGetMethod")
                completion(nil, error)
                return
            }
            print(data)
            //completion(data, nil)
            let jsonDecoder = JSONDecoder()
            do {
                let returnData = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as! [[String:AnyObject]]
                
                print(returnData)
                
            } catch {
                DispatchQueue.main.async {
                    print(error)
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    class func searchForRecipie(searchWord: String){
        var url = EndPoints.search.stringValue
        
        var components = URLComponents(string: url)
        
        let querySearch = URLQueryItem(name: "q", value: searchWord)
        //Order Matters, Must go id and then key
        let key = URLQueryItem(name: "app_key", value: EndPoints.apiKey)
        let id = URLQueryItem(name: "app_id", value: EndPoints.apiID)// main search work
        /*
         components.addValue(EndPoints.apiKey, forHTTPHeaderField: "api_key")// add more by seperating with comma
         components.addValue(EndPoints.apiID, forHTTPHeaderField: "api_id")
         components.addValue(searchWord, forHTTPHeaderField: "q")
         */
        //Order matters, must fo id then key
        components?.queryItems = [
            querySearch, id, key
        ]
        //Not a fan of force unwrapping right here. But whatever
        
        
        dataTaskForSearch("GET", url: components!.url!) { (object, error) in
            guard let object = object else {
                print(error)
                return
            }
            print(object)
            do{
                let data = try! JSONSerialization.data(withJSONObject: object, options: [])
                print(data)
            }catch {
                print(error)
            }
        }
        
    }
    
}
    
    
    //Accept-Encoding: gzip HEADER
    //Content-Encoding: gzip Server will tell you if its compressed with this header
    //Example code for Get Method
    /*
    class func taskForGETMethod(_ method: String, parameters: [String : AnyObject], completion: @escaping (_ result: [FlickerPhoto]?, _ error: Error?) -> Void) -> URLSessionDataTask {
        var parametersWithApiKey = parameters
        parametersWithApiKey[FlickerAPIConst.ParameterKeys.Method] = method as AnyObject
        parametersWithApiKey[FlickerAPIConst.ParameterKeys.Callback] = "1" as AnyObject
        parametersWithApiKey[FlickerAPIConst.ParameterKeys.ApiKey] = FlickerAPIConst.ApiKey as AnyObject
        
        let request = URLRequest(url: flickrURLFromParameters(parametersWithApiKey, withPathExtension: ""))
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Entered Error State In TaskForGetMethod")
                completion(nil, error)
                return
            }
            print(data)
            self.serializeDataFromGet(data: data, completion: completion)
        }
        task.resume()
        return task
    }
 */

