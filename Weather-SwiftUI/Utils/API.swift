//
//  API.swift
//  Weather-SwiftUI
//
//  Created by Sinbad on 23/1/20.
//  Copyright © 2020 Sinbad. All rights reserved.
//

import SwiftUI

private let appKey = "f279df88f01232850ddff621c125603d"
private let base_url = URL(string: "https://api.openweathermap.org/data/2.5/weather?")!
private let forcastForWeekly = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?")!

private var decoder : JSONDecoder {
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

class API {
    
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather)-> Void){
        let query = ["q" : "\(city)", "appid": appKey, "units": "Imperial"]
        
        guard let url = base_url.withQuery(query) else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                fatalError(error?.localizedDescription ?? "")
            }
            
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}

extension URL {
    func withQuery(_ queries:[String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else{
            fatalError()
        }
        
        component.queryItems = queries.map{ URLQueryItem(name: $0.key, value: $0.value)}
        
        return component.url
    }
}
