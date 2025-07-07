//
//  BookService.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 24/04/25.
//

import Foundation

enum ErrorDetail: Error {
    case errorURL(urlString: String)
    case detailError(detail: String)
    case requestFailed(error: Error)
    case invalidResponse
    case invalidStatusCode(code: Int)
}


class BookService {
    
    func fetchBooks(for category: String, completion: @escaping (Result<BookData, Error>) -> Void) {
        let urlString = "https://openlibrary.org/subjects/\(category).json"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorDetail.errorURL(urlString: urlString)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(ErrorDetail.requestFailed(error: error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(ErrorDetail.detailError(detail: "Data is nil")))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(ErrorDetail.invalidStatusCode(code: (response as? HTTPURLResponse)?.statusCode ?? -1)))
                return
            }
            
            do {
                let books = try JSONDecoder().decode(BookData.self, from: data)
                completion(.success(books))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
