//
//  WebService.swift
//  Audiobooks
//
//  Created by huayi geng on 2023-04-26.
//

import Foundation

class WebService {
    
    static let shared = WebService()
    
    // set timeout interval
    func getSessionConfig() -> URLSessionConfiguration{
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        return sessionConfig
    }
    
    func callGetResquest(urlString: String, completionHandler: @escaping (Bool, [Podcast]) -> Void) {
        let defaultSession = URLSession(configuration: getSessionConfig())
        
        guard let url = URL(string: urlString) else {return}
        
        // reate task for api call
        let task = defaultSession.dataTask(with: url) { data, response, error in
            
            // error
            if let error = error {
                print("Error with fetching podcasts: \(error)")
                return
            }
            
            // check response codes
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code")
                return
            }
            
            // deal with data
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .useDefaultKeys
            
            if let data = data {
                do {
                    // try decode data
                    let decodeObject = try jsonDecoder.decode(URLResponse.self, from: data)
                    completionHandler(true, decodeObject.podcastList ?? [])
                } catch {
                    print("Error in Data Parsing", error)
                }
            }
            
        }
        task.resume()
    }
}
