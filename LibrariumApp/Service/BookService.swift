//
//  BookService.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 24/04/25.
//

import Foundation
import Alamofire

enum ErrorDetail: Error {
    case errorURL(urlString: String)
    case detailError(detail: String)
    case requestFailed(error: Error)
    case invalidResponse
    case invalidStatusCode(code: Int)
}

protocol BookServiceDelegate: GenericService {
    func fetchBooksByCategory(for category: String, completion: @escaping (Result<BookData, Error>) -> Void)
    func loadCoinsFromLocalJSON(completion: @escaping completion<BookData?>)
}

class BookService: BookServiceDelegate {
    
    func fetchBooksByCategory(for category: String, completion: @escaping (Result<BookData, Error>) -> Void) {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=subject:\(category)&key=AIzaSyBMx7mkzxROsxUkZPJY8TJkX51vCMNDBwo"
        
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
    
    func searchBooks(with query: String, completion: @escaping (Result<BookData, Error>) -> Void) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(encodedQuery)"
        
        AF.request(urlString).responseDecodable(of: BookData.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadCoinsFromLocalJSON(completion: @escaping completion<BookData?>) {
        if let url = Bundle.main.url(forResource: "BooksData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let book: BookData = try JSONDecoder().decode(BookData.self, from: data)
                completion(book, nil)
            } catch {
                completion(nil, FileError.fileDecodingFailed(name: "BooksData", error))
            }
        } else {
            completion(nil, FileError.fileNotFound(name: "BooksData"))
        }
    }
}
