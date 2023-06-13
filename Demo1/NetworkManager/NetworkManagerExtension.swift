//
//  NetworkManagerExtension.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import Foundation
//http://api.openweathermap.org/data/2.5/weather?appid=b274c5ce65b3e435688f3098769c6dee&q=Irving

extension NetworkManager {

    func getCurrentWeather(cityName : String,completion : @escaping ( _ success: Bool, _ results: WeatherModel?, _ error: Error? )-> Void) {
        let endPoint = Constants.endPoints.currentWeather + "?appid=\(Constants.apiKey)&q=\(cityName)"
        sendGetRequest(endPoint: endPoint) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion( false,nil, error )
                return
            }
            else if let data = data {
                do {
                    let jsonData = try JSON(data: data)
                    let weatherModel = WeatherModel(fromJson: jsonData)
                    if weatherModel.cod == 200 {
                        completion( true, weatherModel, nil )
                    }else {
                        completion( false,nil, error )
                    }
                }catch {
                    completion( false,nil, NSError(domain: error.localizedDescription, code: 0) )
                }
            }else {
                completion( false,nil, NSError(domain: "Error in data loading.", code: -1) )
            }
        }
    }
}
