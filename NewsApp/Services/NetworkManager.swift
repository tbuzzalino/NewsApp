//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Tomas Buzzalino on 15/02/2022.
//

import Foundation

class NetworkManager {
    let imageCached = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURL : String = "https://newsapi.org/v2/"
    
    private let USTopHeadLine = "top-headlines?country=us"
    
    func getNews(completion : @escaping ([News]?) -> Void) {
        let urlString = "\(baseURL)\(USTopHeadLine)&apikey=\(APIKey.key)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
        }.resume()
    }
    
    func getImage(urlString : String, completion : @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCached.object(forKey: NSString(string : urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCached.setObject(data as NSData, forKey: NSString(string : urlString))
                completion(data)
            }.resume()
        }
    }
}
