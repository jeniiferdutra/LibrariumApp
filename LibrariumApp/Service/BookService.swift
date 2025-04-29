//
//  BookService.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 24/04/25.
//

import UIKit

enum ErrorDetail: Swift.Error { // MARK: Customizar os tipos de erros
    case errorURL(urlString: String)
    case detailError(detail: String)
    
}

// É responsável por fornecer os dados de livros e categorias, seja por meio de mock ou chamadas de API. Ele centraliza o carregamento, parsing e tratamento de erros, abstraindo a origem dos dados da ViewModel.

class BookService {
    
    func getBookDataURLSession(completion: @escaping (BookData?, Error?) -> Void) {
        // URL da API mockada (poderia ser uma URL real, como do Google Books)
        let urlString : String = "https://run.mocky.io/v3/672ce67c-74e0-437a-bf35-9672093ac508"
        
        // Verifica se a string pode ser convertida para uma URL válida
        guard let url: URL = URL(string: urlString) else { return completion(nil, ErrorDetail.errorURL(urlString: urlString)) }
        
        // Cria a requisição com o método GET
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Cria uma task assíncrona para fazer a requisição
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Verifica se os dados foram recebidos. Caso contrário, retorna erro
            guard let dataResult = data else { return completion(nil, ErrorDetail.detailError(detail: "Error Data")) }
            
            // Converte os dados recebidos em JSON (apenas para debug/log)
            let json = try? JSONSerialization.jsonObject(with: dataResult, options: [])
            print(json as Any)
            
            // Verifica se a resposta é do tipo HTTP
            guard let response = response as? HTTPURLResponse else { return }
            
            // Se o status for 200 (sucesso)
            if response.statusCode == 200 {
                do {
                    // Decodifica os dados no modelo BookData
                    let bookData: BookData = try JSONDecoder().decode(BookData.self, from: dataResult)
                    completion(bookData, nil) // Retorna os dados com sucesso
                } catch {
                    completion(nil, error) // Retorna erro de decodificação
                }
            } else {
                // Se o status não for 200, retorna o erro recebido (pode personalizar)
                completion(nil, error)
            }
        }
        task.resume() // Inicia a task (sem isso, a requisição não acontece)
    }
    
    
    func getBookDataJson(completion: @escaping (BookData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "BookData", withExtension: "json") {  // Busca a URL do arquivo BookData.json dentro do app
            do {
                let data = try Data(contentsOf: url) // Converte o conteúdo do arquivo em dados binários
                let bookData: BookData = try JSONDecoder().decode(BookData.self, from: data) // Decodifica os dados binários para a model BookData
                completion(bookData, nil) // Retorna os dados decodificados via closure
            } catch {
                completion(nil, error) // Retorna erro se a leitura ou decodificação falhar

            }
        }
    }
}
