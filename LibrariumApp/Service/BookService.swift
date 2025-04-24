//
//  BookService.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 24/04/25.
//

import UIKit

// É responsável por fornecer os dados de livros e categorias, seja por meio de mock ou chamadas de API. Ele centraliza o carregamento, parsing e tratamento de erros, abstraindo a origem dos dados da ViewModel.

class BookService {
    
    // MARK: Decodificar um Json para converter para objeto
    
    func getBookDataJson(completion: @escaping (BookData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "BookData", withExtension: "json") { // Buscar a URL
            do {
                let data = try Data(contentsOf: url) // Convertendo o json em dado binário
                let bookData: BookData = try JSONDecoder().decode(BookData.self, from: data)
                completion(bookData, nil)
            } catch {
                completion(nil, error) 
            }
        }
    }
}
