//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Tomas Buzzalino on 15/02/2022.
//

import Foundation

class NewsListViewModel {
    
    // Modelos
    
    var newsVM = [NewsViewModel]()
    
    let reuseId = "news"
    
    func getNews(completion : @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            
            let newsVM = news.map(NewsViewModel.init)
            
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
