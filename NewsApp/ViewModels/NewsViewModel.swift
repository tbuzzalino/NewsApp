//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Tomas Buzzalino on 15/02/2022.
//

import Foundation

struct NewsViewModel {
    let news : News
    
    var author : String {
        return news.author ?? "No disponible."
    }
    
    var title : String {
        return news.title ?? "Titulo no disponible."
    }
    
    var description : String {
        return news.description ?? "Descripcion no encontrada."
    }
    
    var url : String {
        return news.url ?? "No se encontro la URL."
    }
    
    var urlToImage : String {
        return news.urlToImage ?? "No se encontro la imagen."
    }
}
