//
//  NetworkManager.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import Foundation
import Network

class NetworkManager {

    static let sharedInstance = NetworkManager()

    func sendGetRequest(endPoint : String, completion: @escaping (Data?, URLResponse?, Error?) -> Void ) {
        let strUrl = Constants.baseUrl + endPoint
        let url = URL(string: strUrl)
        if let url = url {
            let urlRequest = URLRequest(url: url , cachePolicy: .reloadIgnoringLocalCacheData)
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                completion(data,response,error)
            }.resume()
        }
    }

}
