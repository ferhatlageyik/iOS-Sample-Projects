//
//  NetworkManager.swift
//  Flickr Client App
//
//  Created by Ferhat Geyik on 12.06.2022.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchImage(with url: URL?, completion: @escaping (Data) -> Void){
        if let url = url {
            let requeset = URLRequest(url: url)
            URLSession.shared.dataTask(with: requeset) { data, response, error in
                if let error = error {
                    debugPrint(error)
                }
                if let data = data {
                    DispatchQueue.main.async {
                       completion(data)
                    }
                }
            }.resume()
        }
    }
}
